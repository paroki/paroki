<?php

namespace SIAP\Core\Services;

use ApiPlatform\Core\Exception\InvalidIdentifierException;
use ApiPlatform\Core\Exception\ResourceClassNotFoundException;
use ApiPlatform\Core\Exception\ResourceClassNotSupportedException;
use ApiPlatform\Core\Exception\RuntimeException;
use ApiPlatform\Core\Identifier\IdentifierConverterInterface;
use ApiPlatform\Core\Metadata\Resource\Factory\ResourceMetadataFactoryInterface;
use ApiPlatform\Core\Util\RequestAttributesExtractor;
use ApiPlatform\Core\Validator\ValidatorInterface;
use Doctrine\Bundle\DoctrineBundle\Registry;
use Doctrine\Common\Persistence\ObjectManager;
use SIAP\Core\Entity\MediaObject;
use SIAP\User\Entity\User;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use ApiPlatform\Core\DataProvider\ItemDataProviderInterface;

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
     * @var ValidatorInterface
     */
    private $validator;

    /**
     * @var ResourceMetadataFactoryInterface
     */
    private $metadataFactory;

    /**
     * @var TokenStorageInterface
     */
    private $tokenStorage;

    /**
     * @var array
     */
    private $map = [
        'user' => User::class
    ];

    /**
     * @var ItemDataProviderInterface
     */
    private $dataProvider;

    /**
     * @var IdentifierConverterInterface
     */
    private $identifierConverter;

    /**
     * MediaService constructor.
     * @param Registry $registry
     * @param ValidatorInterface $validator
     * @param ResourceMetadataFactoryInterface $metadataFactory
     * @param TokenStorageInterface $tokenStorage
     * @param ItemDataProviderInterface $dataProvider
     * @param IdentifierConverterInterface $identifierConverter
     */
    public function __construct(
        Registry $registry,
        ValidatorInterface $validator,
        ResourceMetadataFactoryInterface $metadataFactory,
        TokenStorageInterface $tokenStorage,
        ItemDataProviderInterface $dataProvider,
        IdentifierConverterInterface $identifierConverter
    )
    {
        $this->registry = $registry;
        $this->validator = $validator;
        $this->metadataFactory = $metadataFactory;
        $this->tokenStorage = $tokenStorage;
        $this->dataProvider = $dataProvider;
        $this->identifierConverter = $identifierConverter;
    }

    /**
     * @param Request $request
     * @return MediaObject
     * @throws InvalidIdentifierException
     * @throws ResourceClassNotSupportedException
     */
    public function createMediaObject(Request $request)
    {
        $item = $this->getItem($request);
        $manager = $this->manager;
        $uploadedFile = $request->files->get('file');
        if(!$uploadedFile){
            throw new BadRequestHttpException('"File" is required');
        }


        //$media = $this->process($uploadedFile);
        //$this->processEntity($item, $request, $media);
        $getter = 'getfoto';
        $setter = 'setfoto';

        if(is_null($item->getFoto())){
            $item->setFoto(new MediaObject());
        }
        //B379F992-4702-4320-BF08-40E423D1E061

        $item->setFotoFile($uploadedFile);

        //call_user_func([$item, $setter], $media);

        $manager->persist($item);
        $manager->flush();
        return $item->getFoto();
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

    private function processEntity(Request $request, MediaObject $mediaObject)
    {
        $type = $request->get('type');
        $id = $request->get('id');
        $property = $request->get('property');
        $manager = $this->manager;
        $repo = $manager->getRepository($this->map[$type]);
        $entity = $repo->findOneBy(['id' => $id]);

        call_user_func([$entity,$property], $mediaObject);
        $manager->persist($entity);
        $manager->flush();

    }

    /**
     * @param object $item
     * @param UploadedFile $file
     * @return MediaObject
     * @throws \Exception
     */
    private function process(object $item, UploadedFile $file)
    {
        $em = $this->manager;
        $mediaObject = new MediaObject();
        $mediaObject->setFile($file);
        $em->persist($mediaObject);
        $em->flush();
        return $mediaObject;
    }

    /**
     * @param MediaObject $mediaObject
     * @param Request $request
     * @throws ResourceClassNotFoundException
     */
    private function validate(MediaObject $mediaObject, Request $request): void
    {
        $attributes = RequestAttributesExtractor::extractAttributes($request);
        $resourceMetadata = $this->metadataFactory->create(MediaObject::class);

        $validationGroups = $resourceMetadata->getOperationAttribute($attributes, 'validation_groups', null, true);

        $this->validator->validate($mediaObject, ['groups' => $validationGroups]);
    }
}
