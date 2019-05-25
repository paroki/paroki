<?php

namespace SIAP\User\Tests\DependencyInjection;

use Matthias\SymfonyDependencyInjectionTest\PhpUnit\AbstractExtensionTestCase;
use SIAP\User\DependencyInjection\UserExtension;
use SIAP\User\Entity\User;
use Symfony\Component\DependencyInjection\Extension\ExtensionInterface;

class UserExtensionTest extends AbstractExtensionTestCase
{
    protected function getContainerExtensions()
    {
        return [new UserExtension()];
    }

    public function test_load()
    {
        $this->container->setParameter('kernel.project_dir','some_dir');
        $this->load();
        $this->assertContainerBuilderHasService('siap.user.user_manager');

        $container = $this->container;
        $config = $container->getExtensionConfig('fos_user')[0];

        $this->assertEquals('orm', $config['db_driver']);
        $this->assertEquals(User::class, $config['user_class']);
        $this->assertEquals('main',$config['firewall_name']);

        $config = $container->getExtensionConfig('vich_uploader')[0];
        $this->assertEquals('/media/user-foto', $config['mappings']['user_foto']['uri_prefix']);
    }
}
