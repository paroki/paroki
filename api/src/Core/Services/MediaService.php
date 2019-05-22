<?php

namespace SIAP\Core\Services;

use ApiPlatform\Core\Exception\InvalidIdentifierException;
use ApiPlatform\Core\Exception\ResourceClassNotSupportedException;
use ApiPlatform\Core\Exception\RuntimeException;
use ApiPlatform\Core\Identifier\IdentifierConverterInterface;
use ApiPlatform\Core\Metadata\Resource\Factory\ResourceMetadataFactoryInterface;
use ApiPlatform\Core\Util\RequestAttributesExtractor;
use ApiPlatform\Core\Validator\ValidatorInterface;
use Doctrine\Bundle\DoctrineBundle\Registry;
use Doctrine\Common\Persistence\ObjectManager;
use SIAP\Core\Entity\MediaObject;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use ApiPlatform\Core\DataProvider\ItemDataProviderInterface;
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
     * @param Registry $registry
     * @param ValidatorInterface $validator
     * @param ResourceMetadataFactoryInterface $metadataFactory
     * @param TokenStorageInterface $tokenStorage
     * @param ItemDataProviderInterface $dataProvider
     * @param IdentifierConverterInterface $identifierConverter
     * @param PropertyMappingFactory $mappingFactory
     */
    public function __construct(
        Registry $registry,
        TokenStorageInterface $tokenStorage,
        ItemDataProviderInterface $dataProvider,
        IdentifierConverterInterface $identifierConverter,
        PropertyMappingFactory $mappingFactory
    )
    {

        $this->registry = $registry;
        $this->tokenStorage = $tokenStorage;
        $this->dataProvider = $dataProvider;
        $this->identifierConverter = $identifierConverter;
        $this->mappingFactory = $mappingFactory;
    }

    /**
     * @param Request $request
     * @return object|null
     * @throws InvalidIdentifierException
     * @throws ResourceClassNotSupportedException
     */
    public function createMediaObject(Request $request)
    {
        $item = $this->getItem($request);
        $manager = $this->manager;
        $uploadedFile = $request->files->get('file');
        $user = $this->tokenStorage->getToken()->getUser();


        if(!$uploadedFile){
            throw new BadRequestHttpException('"File" is required');
        }

        $property = $request->get('property');
        $getter = 'get'.$property;
        $setter = 'set'.$property;
        $fileSetter = 'set'.$property.'file';

        /* @var MediaObject $mediaObject */
        $mediaObject = call_user_func([$item,$getter]);
        if(!$mediaObject instanceof MediaObject){
            $mediaObject = new MediaObject();
            call_user_func([$item, $setter],$mediaObject);
        }

        call_user_func([$item,$fileSetter],$uploadedFile);

        $mapping = $this->mappingFactory->fromField($item, $property.'File');
        $mediaObject->setUploadedBy($user);
        $mediaObject->setUploadedAt(new \DateTimeImmutable());

        $mediaObject->setUrlPrefix($mapping->getUriPrefix());
        $manager->persist($item);
        $manager->flush();

        return call_user_func([$item, $getter]);
    }

    /**
     * @param   Request $request
     * @return  object|null
     * @throws  InvalidIdentifierException
     * @throws  ResourceClassNotSupportedException
     */
    private function getItem(Request $request)
    {
        $attributes = RequestAttributesExtractor::extractAttributes($request);
        $provider = $this->dataProvider;
        $identifiers = $this->extractIdentifiers($request->attributes->all(), $attributes);
        $resourceClass = $attributes['resource_class'];

        $item = $provider->getItem($resourceClass, $identifiers, $attributes['item_operation_name']);
        $this->manager = $this->registry->getManagerForClass($resourceClass);

        return $item;
    }

    /**
     * @param array $parameters
     * @param array $attributes
     * @return array|mixed
     * @throws InvalidIdentifierException
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
