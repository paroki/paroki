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
use SIAP\Baptis\Entity\BaptisKomuni;
use SIAP\Core\Test\MutableSpecTrait;

class BaptisKomuniSpec extends ObjectBehavior
{
    use MutableSpecTrait;

    public function it_is_initializable()
    {
        $this->shouldHaveType(BaptisKomuni::class);
    }

    public function getMutableProperties()
    {
        return [
            'tempat'      => 'some',
            'tanggal'     => new \DateTime(),
            'yangMemberi' => 'some',
            'catatan'     => 'some',
            'id'          => null,
            'register'    => 'some',
        ];
    }

    public function getMutableClassToTest()
    {
        return BaptisKomuni::class;
    }
}
