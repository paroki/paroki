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

namespace SIAP\Core\Bridge\ApiPlatform;

use ApiPlatform\Core\Api\OperationType;
use ApiPlatform\Core\Operation\PathSegmentNameGeneratorInterface;
use ApiPlatform\Core\PathResolver\OperationPathResolverInterface;
use Doctrine\Common\Inflector\Inflector;

final class OperationPathResolver implements PathSegmentNameGeneratorInterface, OperationPathResolverInterface
{
    public function getSegmentName(string $name, bool $collection = true): string
    {
        $path = Inflector::tableize($name);

        return str_replace('_', '-', $path);
    }

    public function resolveOperationPath(string $resourceShortName, array $operation, $operationType): string
    {
        $path = Inflector::tableize($resourceShortName);
        $path = str_replace('_', '-', $path);
        if (OperationType::ITEM === $operationType) {
            $path .= '/{id}';
        }

        $path .= '.{_format}';

        return $path;
    }
}
