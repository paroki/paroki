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

namespace SIAP\Core\DependencyInjection;

use Ramsey\Uuid\Doctrine\UuidType;
use Symfony\Component\Config\FileLocator;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Extension\Extension;
use Symfony\Component\DependencyInjection\Extension\PrependExtensionInterface;
use Symfony\Component\DependencyInjection\Loader\XmlFileLoader;
use Vich\UploaderBundle\Naming\UniqidNamer;

class CoreExtension extends Extension implements PrependExtensionInterface
{
    public function prepend(ContainerBuilder $container)
    {
        $publicDir = $container->getParameter('kernel.project_dir').'/public/media';

        $container->prependExtensionConfig('vich_uploader', [
            'db_driver' => 'orm',
            'mappings'  => [
                'media_object' => [
                    'uri_prefix'         => 'media',
                    'upload_destination' => $publicDir,
                    'namer'              => UniqidNamer::class,
                    'inject_on_load'     => true,
                    'delete_on_update'   => true,
                    'delete_on_remove'   => true,
                ],
            ],
        ]);

        $container->prependExtensionConfig('doctrine', [
            'dbal' => [
                'types' => [
                    'uuid' => UuidType::class,
                ],
            ],
        ]);
    }

    public function load(array $configs, ContainerBuilder $container)
    {
        $locator = new FileLocator(__DIR__.'/../Resources/config');
        $loader  = new XmlFileLoader($container, $locator);

        $loader->load('services.xml');
    }
}
