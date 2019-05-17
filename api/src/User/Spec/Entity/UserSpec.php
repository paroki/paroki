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

namespace Spec\SIAP\User\Entity;

use PhpSpec\ObjectBehavior;
use SIAP\Reference\Entity\Paroki;
use SIAP\User\Entity\User;

class UserSpec extends ObjectBehavior
{
    public function it_is_initializable()
    {
        $this->shouldHaveType(User::class);
    }

    public function its_id_should_be_null_by_default()
    {
        $this->getId()->shouldReturn(null);
    }

    public function its_nama_should_be_mutable()
    {
        $this->setNama('some')->shouldReturn($this);
        $this->getNama()->shouldReturn('some');
    }

    public function its_paroki_should_be_mutable(Paroki $paroki)
    {
        $this->setParoki($paroki)->shouldReturn($this);
        $this->getParoki()->shouldReturn($paroki);
    }
}
