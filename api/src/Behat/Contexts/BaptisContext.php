<?php


namespace SIAP\Behat\Contexts;


use Behat\Behat\Context\Context;
use SIAP\Baptis\Entity\Baptis;
use SIAP\Baptis\Services\BaptisManager;

class BaptisContext implements Context
{
    /**
     * @var BaptisManager
     */
    private $manager;

    public function __construct(
        BaptisManager $manager
    )
    {
        $this->manager = $manager;
    }

    /**
     * @Given I don't have baptis data with kode :kode
     * @param string $kode
     */
    public function iDontHaveBaptisDataWithKode($kode)
    {
        $manager = $this->manager;
        $data = $manager->findOneByKodeBaptis($kode);
        if($data instanceof Baptis){
            $manager->delete($data);
        }
    }
}
