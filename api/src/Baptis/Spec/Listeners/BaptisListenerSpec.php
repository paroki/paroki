<?php

namespace Spec\SIAP\Baptis\Listeners;

use SIAP\Baptis\Entity\Baptis;
use SIAP\Baptis\Listeners\BaptisListener;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;
use SIAP\Reference\Entity\Paroki;
use SIAP\Reference\Events\SetParokiEvent;

class BaptisListenerSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType(BaptisListener::class);
    }

    function it_should_set_kode_baptis_automatically(
        SetParokiEvent $event,
        Baptis $entity,
        Paroki $paroki
    )
    {
        $event->getEntity()->willReturn($entity);
        $entity->getParoki()->willReturn($paroki);
        $paroki->getKode()->willReturn('paroki');

        $entity->getBuku()->willReturn('buku');
        $entity->getHalaman()->willReturn(1);
        $entity->getNomor()->willReturn(999);
        $entity->getLanjutan()->willReturn('lanjutan');
        $entity->setKodeBaptis('paroki.buku.1.999.lanjutan')
            ->shouldBeCalled();

        $this->onSetParoki($event);
    }
}
