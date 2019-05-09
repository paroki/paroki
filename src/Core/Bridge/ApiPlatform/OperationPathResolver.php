<?php


namespace Paroki\Core\Bridge\ApiPlatform;


use ApiPlatform\Core\Api\OperationType;
use ApiPlatform\Core\PathResolver\OperationPathResolverInterface;
use Doctrine\Common\Inflector\Inflector;
use ApiPlatform\Core\Operation\PathSegmentNameGeneratorInterface;

final class OperationPathResolver implements PathSegmentNameGeneratorInterface, OperationPathResolverInterface
{
    public function getSegmentName(string $name, bool $collection = true): string
    {
        $path = Inflector::tableize($name);
        $path = str_replace('_','-',$path);
        return $path;
    }

    public function resolveOperationPath(string $resourceShortName, array $operation, $operationType): string
    {
        $path = Inflector::tableize($resourceShortName);
        $path = str_replace('_','-',$path);
        if (OperationType::ITEM === $operationType) {
            $path .= '/{id}';
        }

        $path .= '.{_format}';

        return $path;
    }
}
