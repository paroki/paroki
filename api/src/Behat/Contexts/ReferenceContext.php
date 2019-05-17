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

namespace SIAP\Behat\Contexts;

use Behat\Behat\Context\Context;
use Doctrine\Bundle\DoctrineBundle\Registry;
use SIAP\Reference\Entity\Keuskupan;
use SIAP\Reference\Entity\Paroki;

class ReferenceContext implements Context
{
    /**
     * @var \Doctrine\Common\Persistence\ObjectManager|object
     */
    private $manager;

    public function __construct(
        Registry $doctrine
    ) {
        $this->manager = $doctrine->getManager();
    }

    /**
     * @return object|Keuskupan|null
     */
    public function iHaveKeuskupan($nama)
    {
        $keuskupan = $this->getKeuskupanRepository()
            ->findOneBy(['kode' => 999]);
        $manager = $this->manager;

        if (!$keuskupan instanceof Keuskupan) {
            $keuskupan = new Keuskupan();
        }

        $keuskupan->setKode(999)
            ->setNama($nama);
        $manager->persist($keuskupan);
        $manager->flush();

        return $keuskupan;
    }

    /**
     * @Given I have paroki :name
     *
     * @param string $nama
     * @param string $keuskupan
     *
     * @return object|Paroki|null
     */
    public function iHaveParoki($nama, $keuskupan='test')
    {
        $repository = $this->getParokiRepository();

        $paroki = $repository->findOneBy(['kode' => '999.999']);
        if (!$paroki  instanceof Paroki) {
            $keuskupan = $this->iHaveKeuskupan($keuskupan);
            $paroki    = new Paroki();
            $paroki->setKeuskupan($keuskupan);
        }

        $paroki
            ->setKode('999.999')
            ->setNama($nama);

        $this->manager->persist($paroki);
        $this->manager->flush();

        return $paroki;
    }

    protected function getParokiRepository()
    {
        return $this->manager->getRepository(Paroki::class);
    }

    protected function getKeuskupanRepository()
    {
        return $this->manager->getRepository(Keuskupan::class);
    }
}
