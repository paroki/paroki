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

namespace Spec\SIAP\Core\Services;

use ApiPlatform\Core\DataProvider\ItemDataProviderInterface;
use ApiPlatform\Core\Identifier\IdentifierConverterInterface;
use Doctrine\Bundle\DoctrineBundle\Registry;
use PhpSpec\ObjectBehavior;
use SIAP\Core\Services\MediaService;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorage;
use Vich\UploaderBundle\Mapping\PropertyMappingFactory;

class MediaServiceSpec extends ObjectBehavior
{
    public function let(
        Registry $registry,
        TokenStorage $tokenStorage,
        ItemDataProviderInterface $dataProvider,
        IdentifierConverterInterface $identifierConverter,
        PropertyMappingFactory $mappingFactory
    ) {
        $this->beConstructedWith($registry, $tokenStorage, $dataProvider, $identifierConverter, $mappingFactory);
    }

    public function it_is_initializable()
    {
        $this->shouldHaveType(MediaService::class);
    }
}
