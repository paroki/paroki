<?php

namespace SIAP\Core\Controller;

use ApiPlatform\Core\Exception\InvalidIdentifierException;
use ApiPlatform\Core\Exception\ResourceClassNotSupportedException;
use ApiPlatform\Core\Metadata\Resource\Factory\ResourceMetadataFactoryInterface;
use ApiPlatform\Core\Validator\ValidatorInterface;
use Doctrine\Common\Persistence\ManagerRegistry;
use SIAP\Core\Services\MediaService;
use SIAP\User\Entity\User;
use Symfony\Component\HttpFoundation\Request;

final class CreateMediaObject
{
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
     * @return object|null
     * @throws InvalidIdentifierException
     * @throws ResourceClassNotSupportedException
     */
    public function __invoke(Request $request, MediaService $service): ?object
    {
        return $service->createMediaObject($request);
    }
}
