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
     * @return object|Paroki
     */
    public function getParoki(): ?Paroki
    {
        return $this->getRepository(Paroki::class)
            ->find('028.18');
    }

    public function testRelation()
    {
        $em = $this->em;
        $ob = new Baptis();
        $ob->setBuku('BT')
            ->setNomor(1)
            ->setParoki($this->getParoki())
            ->setNama('Antonius');

        $em->persist($ob);
        $em->flush();
    }
}
