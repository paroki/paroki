<?php

namespace SIAP\Core\Controller;

use ApiPlatform\Core\Exception\ResourceClassNotFoundException;
use ApiPlatform\Core\Metadata\Resource\Factory\ResourceMetadataFactoryInterface;
use ApiPlatform\Core\Util\RequestAttributesExtractor;
use ApiPlatform\Core\Validator\ValidatorInterface;
use SIAP\Core\Entity\MediaObject;
use Doctrine\Common\Persistence\ManagerRegistry;
use SIAP\User\Entity\User;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpKernel\Exception\BadRequestHttpException;

final class CreateMediaObject
{
    private $map = [
        'user' => User::class
    ];

    private $managerRegistry;

    private $validator;

    private $resourceMetadataFactory;

    public function __construct(ManagerRegistry $managerRegistry, ValidatorInterface $validator, ResourceMetadataFactoryInterface $resourceMetadataFactory)
    {
        $this->managerRegistry = $managerRegistry;
        $this->validator = $validator;
        $this->resourceMetadataFactory = $resourceMetadataFactory;
    }

    /**
     * @param Request $request
     * @return MediaObject
     * @throws ResourceClassNotFoundException
     */
    public function __invoke(Request $request): MediaObject
    {
        /* @var UploadedFile $uploadedFile */
        $uploadedFile = $request->files->get('file');

        if (!$uploadedFile) {
            throw new BadRequestHttpException('"file" is required');
        }

        $mediaObject = new MediaObject();
        $mediaObject->setNama($request->get('nama'));
        $mediaObject->setFile($uploadedFile);

        $this->validate($mediaObject, $request);


        $em = $this->managerRegistry->getManager();
        $em->persist($mediaObject);
        $em->flush();

        $type = $request->get('type');
        $id = $request->get('id');
        $property = 'set'.$request->get('property');
        $repo = $this->managerRegistry->getManager()->getRepository($this->map[$type]);
        $entity = $repo->findOneBy(['id' => $id]);
        call_user_func_array([$entity,$property],[$mediaObject]);

        $em->persist($entity);
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
        $resourceMetadata = $this->resourceMetadataFactory->create(MediaObject::class);

        $validationGroups = $resourceMetadata->getOperationAttribute($attributes, 'validation_groups', null, true);

        $this->validator->validate($mediaObject, ['groups' => $validationGroups]);
    }
}
