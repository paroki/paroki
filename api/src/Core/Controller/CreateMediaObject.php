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

namespace SIAP\Core\Controller;

use ApiPlatform\Core\Exception\InvalidIdentifierException;
use ApiPlatform\Core\Exception\ResourceClassNotSupportedException;
use ApiPlatform\Core\Metadata\Resource\Factory\ResourceMetadataFactoryInterface;
use ApiPlatform\Core\Validator\ValidatorInterface;
use Doctrine\Common\Persistence\ManagerRegistry;
use SIAP\Core\Services\MediaService;
use Symfony\Component\HttpFoundation\Request;

final class CreateMediaObject
{
    private $managerRegistry;

    private $validator;

    private $resourceMetadataFactory;

    public function __construct(ManagerRegistry $managerRegistry, ValidatorInterface $validator, ResourceMetadataFactoryInterface $resourceMetadataFactory)
    {
        $this->managerRegistry         = $managerRegistry;
        $this->validator               = $validator;
        $this->resourceMetadataFactory = $resourceMetadataFactory;
    }

    /**
     * @throws InvalidIdentifierException
     * @throws ResourceClassNotSupportedException
     */
    public function __invoke(Request $request, MediaService $service): ?object
    {
        return $service->createMediaObject($request);
    }
}
