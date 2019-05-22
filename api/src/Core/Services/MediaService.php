<?php

/*
 * This file is part of the Sistim Informasi Antar Paroki (SIAP) project.
 *
 * (c) Anthonius Munthi <me@itstoni.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

declare(strict_types=1);

namespace SIAP\Core\Services;

use ApiPlatform\Core\DataProvider\ItemDataProviderInterface;
use ApiPlatform\Core\Exception\InvalidIdentifierException;
use ApiPlatform\Core\Exception\ResourceClassNotSupportedException;
use ApiPlatform\Core\Exception\RuntimeException;
use ApiPlatform\Core\Identifier\IdentifierConverterInterface;
use ApiPlatform\Core\Util\RequestAttributesExtractor;
use Doctrine\Bundle\DoctrineBundle\Registry;
use Doctrine\Common\Persistence\ObjectManager;
use SIAP\Core\Entity\MediaObject;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Vich\UploaderBundle\Mapping\PropertyMapping;
use Vich\UploaderBundle\Mapping\PropertyMappingFactory;

class MediaService
{
    /**
     * @var Registry
     */
    private $registry;

    /**
     * @var ObjectManager
     */
    private $manager;

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;

    /**
     * @var ItemDataProviderInterface
     */
    private $dataProvider;

    /**
     * @var IdentifierConverterInterface
     */
    private $identifierConverter;

    /**
     * @var PropertyMapping
     */
    private $mappingFactory;

    /**
     * MediaService constructor.
     */
    public function __construct(
        Registry $registry,
        TokenStorageInterface $tokenStorage,
        ItemDataProviderInterface $dataProvider,
        IdentifierConverterInterface $identifierConverter,
        PropertyMappingFactory $mappingFactory
    ) {
        $this->registry            = $registry;
        $this->tokenStorage        = $tokenStorage;
        $this->dataProvider        = $dataProvider;
        $this->identifierConverter = $identifierConverter;
        $this->mappingFactory      = $mappingFactory;
    }

    /**
     * @throws InvalidIdentifierException
     * @throws ResourceClassNotSupportedException
     *
     * @return object|null
     */
    public function createMediaObject(Request $request)
    {
        $item         = $this->getItem($request);
        $manager      = $this->manager;
        $uploadedFile = $request->files->get('file');
        $user         = $this->tokenStorage->getToken()->getUser();

        if (!$uploadedFile) {
            throw new BadRequestHttpException('"File" is required');
        }

        $property   = $request->get('property');
        $getter     = 'get'.$property;
        $setter     = 'set'.$property;
        $fileSetter = 'set'.$property.'file';

        /** @var MediaObject $mediaObject */
        $mediaObject = \call_user_func([$item, $getter]);
        if (!$mediaObject instanceof MediaObject) {
            $mediaObject = new MediaObject();
            \call_user_func([$item, $setter], $mediaObject);
        }

        \call_user_func([$item, $fileSetter], $uploadedFile);

        $mapping = $this->mappingFactory->fromField($item, $property.'File');
        $mediaObject->setUploadedBy($user);
        $mediaObject->setUploadedAt(new \DateTimeImmutable());

        $mediaObject->setUrlPrefix($mapping->getUriPrefix());
        $manager->persist($item);
        $manager->flush();

        return \call_user_func([$item, $getter]);
    }

    /**
     * @throws InvalidIdentifierException
     * @throws ResourceClassNotSupportedException
     *
     * @return object|null
     */
    private function getItem(Request $request)
    {
        $attributes    = RequestAttributesExtractor::extractAttributes($request);
        $provider      = $this->dataProvider;
        $identifiers   = $this->extractIdentifiers($request->attributes->all(), $attributes);
        $resourceClass = $attributes['resource_class'];

        $item          = $provider->getItem($resourceClass, $identifiers, $attributes['item_operation_name']);
        $this->manager = $this->registry->getManagerForClass($resourceClass);

        return $item;
    }

    /**
     * @throws InvalidIdentifierException
     *
     * @return array|mixed
     */
    private function extractIdentifiers(array $parameters, array $attributes)
    {
        if (isset($attributes['item_operation_name'])) {
            if (!isset($parameters['id'])) {
                throw new InvalidIdentifierException('Parameter "id" not found');
            }

            $id = $parameters['id'];

            if (null !== $this->identifierConverter) {
                return $this->identifierConverter->convert((string) $id, $attributes['resource_class']);
            }

            return $id;
        }

        if (!isset($attributes['subresource_context'])) {
            throw new RuntimeException('Either "item_operation_name" or "collection_operation_name" must be defined, unless the "_api_receive" request attribute is set to false.');
        }

        $identifiers = [];

        foreach ($attributes['subresource_context']['identifiers'] as $key => [$id, $resourceClass, $hasIdentifier]) {
            if (false === $hasIdentifier) {
                continue;
            }

            $identifiers[$id] = $parameters[$id];

            if (null !== $this->identifierConverter) {
                $identifiers[$id] = $this->identifierConverter->convert((string) $identifiers[$id], $resourceClass);
            }
        }

        return $identifiers;
    }
}
