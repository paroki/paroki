<?php


namespace SIAP\Baptis\Services;


use Doctrine\Common\Persistence\ObjectManager;
use SIAP\Baptis\Entity\Baptis;

class BaptisManager
{
    /**
     * @var ObjectManager
     */
    private $manager;

    public function __construct(
        ObjectManager $manager
    )
    {
        $this->manager = $manager;
    }

    /**
     * @param string $kode
     * @return null|Baptis
     */
    public function findOneByKodeBaptis($kode): ?Baptis
    {
        $repository = $this->getBaptisRepository();
        return $repository->findOneBy([
            'kodeBaptis' => $kode
        ]);
    }

    /**
     * @return Baptis
     */
    public function create()
    {
        return new Baptis();
    }

    public function update(Baptis $baptis, $andFlush = true)
    {
        $manager = $this->manager;
        $manager->persist($baptis);
        if($andFlush) {
            $manager->flush();
        }
    }

    /**
     * @param Baptis $baptis
     */
    public function delete(Baptis $baptis)
    {
        $this->manager->remove($baptis);
        $this->manager->flush();
    }

    /**
     * @return \Doctrine\Common\Persistence\ObjectRepository
     */
    public function getBaptisRepository()
    {
        return $this->manager->getRepository(Baptis::class);
    }
}
