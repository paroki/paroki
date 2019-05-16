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

/*
 * This file is part of the Omed package.
 *
 * (c) Anthonius Munthi <me@itstoni.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace SIAP\Baptis\Tests\Entity;

use SIAP\Baptis\Entity\Baptis;
use SIAP\Core\Test\DatabaseTestCase;
use SIAP\Reference\Entity\Paroki;

class BaptisTest extends DatabaseTestCase
{
    /**
     * @return null|object|Paroki
     */
    public function getParoki(): ?Paroki
    {
        return $this->getRepository(Paroki::class)
            ->findOneBy(['kode' => '999.999']);
    }

    public function findAndDelete($kode)
    {
        $em   = $this->em;
        $data = $this->getRepository(Baptis::class)
            ->findOneBy(['kodeBaptis' => $kode]);

        if ($data instanceof Baptis) {
            $em->remove($data);
            $em->flush();
        }
    }

    public function testRelation()
    {
        $em     = $this->em;
        $kode   = '999.999.I.1.1';
        $paroki = $this->getParoki();

        $this->findAndDelete($kode);
        $ob = new Baptis();
        $ob->setBuku('I')
            ->setHalaman(1)
            ->setNomor(1)
            ->setParoki($paroki)
            ->setNama('Anthonius')
            ->setJenisKelamin(1);

        $em->persist($ob);
        $em->flush();

        $this->assertEquals($kode, $ob->getKodeBaptis());
        $this->assertEquals($paroki, $this->getParoki());
    }
}
