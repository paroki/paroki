<?php

namespace SIAP\Core\Controller;

use ApiPlatform\Core\Exception\ResourceClassNotFoundException;
use ApiPlatform\Core\Metadata\Resource\Factory\ResourceMetadataFactoryInterface;
use ApiPlatform\Core\Util\RequestAttributesExtractor;
use ApiPlatform\Core\Validator\ValidatorInterface;
use SIAP\Core\Entity\MediaObject;
use Doctrine\Common\Persistence\ManagerRegistry;
use SIAP\Core\Services\MediaService;
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
     * @param MediaService $service
     * @return MediaObject
     */
    public function __invoke(Request $request, MediaService $service): MediaObject
    {
        return $service->createMediaObject($request);
    }
}
