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

namespace Spec\SIAP\Baptis\Entity;

use PhpSpec\ObjectBehavior;
use SIAP\Baptis\Entity\BaptisPerkawinan;

class BaptisPerkawinanSpec extends ObjectBehavior
{
    public function it_is_initializable()
    {
        $this->shouldHaveType(BaptisPerkawinan::class);
    }

    public function getMutableProperties()
    {
        return [
            'register'      => 'some',
            'tempat'        => 'some',
            'tanggal'       => new \DateTime(),
            'menikahDengan' => 'some',
            'saksiGereja'   => 'some',
            'catatan'       => 'some',
            'id'            => null,
        ];
    }

    public function getMutableClassToTest()
    {
        return BaptisPerkawinan::class;
    }
}
