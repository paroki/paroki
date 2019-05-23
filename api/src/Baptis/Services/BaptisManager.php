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
    ) {
        $this->manager = $manager;
    }

    /**
     * @param string $kode
     */
    public function findOneByKodeBaptis($kode): ?Baptis
    {
        $repository = $this->getBaptisRepository();

        return $repository->findOneBy([
            'kodeBaptis' => $kode,
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
        if ($andFlush) {
            $manager->flush();
        }
    }

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
