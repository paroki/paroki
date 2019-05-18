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
use SIAP\Baptis\Entity\Diterima;

class DiterimaSpec extends ObjectBehavior
{
    public function it_is_initializable()
    {
        $this->shouldHaveType(Diterima::class);
    }

    public function getMutableProperties()
    {
        return [
            'tempatBaptis'    => 'some',
            'tanggalBaptis'   => new \DateTime(),
            'menikahDengan'   => 'some',
            'gerejaBaptis'    => 'some',
            'yangMembaptis'   => 'some',
            'nomorBukuBaptis' => null,
            'catatan'         => 'some',
            'id'              => null,
        ];
    }

    public function getMutableClassToTest()
    {
        return Diterima::class;
    }
}
