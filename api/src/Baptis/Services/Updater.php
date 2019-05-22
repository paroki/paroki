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

use SIAP\Baptis\Entity\Baptis;
use SIAP\Reference\Entity\Paroki;

class Updater
{
    public function update(Baptis $entity)
    {
        $paroki = $entity->getParoki();

        if (!$paroki instanceof Paroki) {
            return;
        }

        $kode = [$paroki->getKode()];

        if (null !== $entity->getBuku()) {
            $kode[] = $entity->getBuku();
        }

        if (null !== $entity->getHalaman()) {
            $kode[] = $entity->getHalaman();
        }

        if (null !== $entity->getNomor()) {
            $kode[] = $entity->getNomor();
        }

        if (null !== $entity->getLanjutan()) {
            $kode[] = $entity->getLanjutan();
        }

        $entity->setKodeBaptis(implode('.', $kode));
    }
}
