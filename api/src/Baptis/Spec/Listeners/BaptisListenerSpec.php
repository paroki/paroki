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

namespace Spec\SIAP\Baptis\Listeners;

use PhpSpec\ObjectBehavior;
use SIAP\Baptis\Entity\Baptis;
use SIAP\Baptis\Listeners\BaptisListener;
use SIAP\Reference\Entity\Paroki;
use SIAP\Reference\Events;
use SIAP\Reference\Events\SetParokiEvent;

class BaptisListenerSpec extends ObjectBehavior
{
    public function it_is_initializable()
    {
        $this->shouldHaveType(BaptisListener::class);
    }

    public function it_should_subscribe_to_kernel_event()
    {
        $events = $this->getSubscribedEvents();
        $events->shouldHaveKey(Events::SET_PAROKI);
    }

    public function it_should_set_kode_baptis_automatically(
        SetParokiEvent $event,
        Baptis $entity,
        Paroki $paroki
    ) {
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
