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

namespace SIAP\User\DependencyInjection;

use SIAP\User\Entity\User;
use Symfony\Component\Config\FileLocator;
use Symfony\Component\DependencyInjection\ContainerBuilder;
use Symfony\Component\DependencyInjection\Extension\Extension;
use Symfony\Component\DependencyInjection\Extension\PrependExtensionInterface;
use Symfony\Component\DependencyInjection\Loader\XmlFileLoader;
use Symfony\Component\DependencyInjection\Loader\YamlFileLoader;
use Vich\UploaderBundle\Naming\UniqidNamer;

class UserExtension extends Extension implements PrependExtensionInterface
{
    public function prepend(ContainerBuilder $container)
    {
        $container->prependExtensionConfig('fos_user', [
            'db_driver'     => 'orm',
            'user_class'    => User::class,
            'firewall_name' => 'main',
            'from_email'    => [
                'address'     => 'me@itstoni.com',
                'sender_name' => 'Anthonius Munthi',
            ],
            'service' => [
                'user_manager' => 'siap.user.user_manager',
            ],
        ]);

        $publicDir = $container->getParameter('kernel.project_dir').'/public/media/user-foto';
        $container->prependExtensionConfig('vich_uploader', [
            'mappings' => [
                'user_foto' => [
                    'uri_prefix'         => '/media/user-foto',
                    'upload_destination' => $publicDir,
                    'namer'              => UniqidNamer::class,
                    'inject_on_load'     => false,
                    'delete_on_update'   => true,
                    'delete_on_remove'   => true,
                ],
            ],
        ]);
    }

    public function load(array $configs, ContainerBuilder $container)
    {
        $locator = new FileLocator(__DIR__.'/../Resources/config');

        $loader = new XmlFileLoader($container, $locator);
        $loader->load('services.xml');

        $loader  = new YamlFileLoader($container, $locator);
        $loader->load('services.yaml');
    }
}
