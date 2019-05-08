<?php


namespace Paroki\Core\Test;


use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

abstract class DatabaseTestCase extends KernelTestCase
{
    protected $em;

    protected function setUp()
    {
        $kernel = self::bootKernel();
        $this->em = $kernel->getContainer()
            ->get('doctrine')
            ->getManager();
    }
}
