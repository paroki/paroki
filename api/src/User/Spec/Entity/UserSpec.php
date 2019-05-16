<?php

namespace Spec\SIAP\User\Entity;

use SIAP\Reference\Entity\Paroki;
use SIAP\User\Entity\User;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class UserSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType(User::class);
    }

    function its_id_should_be_null_by_default()
    {
        $this->getId()->shouldReturn(null);
    }

    function its_nama_should_be_mutable()
    {
        $this->setNama('some')->shouldReturn($this);
        $this->getNama()->shouldReturn('some');
    }

    function its_paroki_should_be_mutable(Paroki $paroki)
    {
        $this->setParoki($paroki)->shouldReturn($this);
        $this->getParoki()->shouldReturn($paroki);
    }
}
