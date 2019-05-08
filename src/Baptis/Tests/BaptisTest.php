<?php

/*
 * This file is part of the Omed package.
 *
 * (c) Anthonius Munthi <me@itstoni.com>
 *
 * For the full copyright and license information, please view the LICENSE
 * file that was distributed with this source code.
 */

namespace Paroki\Baptis\Tests\Entity;

use Paroki\Baptis\Entity\Baptis;
use Paroki\Core\Test\DatabaseTestCase;
use Paroki\Reference\Entity\Paroki;

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
            ->setNama('Antonius')
        ;

        $em->persist($ob);
        $em->flush();
    }
}
