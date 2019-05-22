<?php

namespace Spec\SIAP\Core\Services;

use ApiPlatform\Core\DataProvider\ItemDataProviderInterface;
use ApiPlatform\Core\Identifier\IdentifierConverterInterface;
use Doctrine\Bundle\DoctrineBundle\Registry;
use SIAP\Core\Services\MediaService;
use PhpSpec\ObjectBehavior;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;
use Vich\UploaderBundle\Mapping\PropertyMappingFactory;

class MediaServiceSpec extends ObjectBehavior
{
    function let(
        Registry $registry,
        TokenStorage $tokenStorage,
        ItemDataProviderInterface $dataProvider,
        IdentifierConverterInterface $identifierConverter,
        PropertyMappingFactory $mappingFactory
    )
    {
        $this->beConstructedWith($registry, $tokenStorage, $dataProvider, $identifierConverter, $mappingFactory);
    }

    function it_is_initializable()
    {
        $this->shouldHaveType(MediaService::class);
    }
}
