<?php

namespace Spec\SIAP\Core\Entity;

use SIAP\Core\Entity\MediaObject;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class MediaObjectSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType(MediaObject::class);
    }
}
