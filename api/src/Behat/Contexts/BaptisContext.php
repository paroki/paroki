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
    ) {
        $this->manager = $manager;
    }

    /**
     * @Given I don't have baptis data with kode :kode
     *
     * @param string $kode
     */
    public function iDontHaveBaptisDataWithKode($kode)
    {
        $manager = $this->manager;
        $data    = $manager->findOneByKodeBaptis($kode);
        if ($data instanceof Baptis) {
            $manager->delete($data);
        }
    }
}
