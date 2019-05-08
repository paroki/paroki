<?php


namespace Paroki\Core\Test;


use Doctrine\ORM\EntityManager;
use Doctrine\ORM\EntityRepository;
use Symfony\Bundle\FrameworkBundle\Test\KernelTestCase;

abstract class DatabaseTestCase extends KernelTestCase
{
    /**
     * @var EntityManager
     */
    protected $em;

    protected function setUp()
    {
        $kernel = self::bootKernel();
        $this->em = $kernel->getContainer()
            ->get('doctrine')
            ->getManager();
    }

    /**
     * @param $class
     * @return EntityRepository
     */
    protected function getRepository($class)
    {
        return $this->getRepository($class);
    }
}
