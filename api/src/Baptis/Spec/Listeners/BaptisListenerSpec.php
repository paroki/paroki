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

use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use PhpSpec\ObjectBehavior;
use SIAP\Baptis\Entity\Baptis;
use SIAP\Baptis\Listeners\BaptisListener;
use SIAP\Baptis\Services\Updater;
use SIAP\Reference\Events;
use SIAP\Reference\Events\SetParokiEvent;

class BaptisListenerSpec extends ObjectBehavior
{
    public function let(
        Updater $updater
    ) {
        $this->beConstructedWith($updater);
    }

    public function it_is_initializable()
    {
        $this->shouldHaveType(BaptisListener::class);
    }

    public function it_should_subscribe_to_kernel_event()
    {
        $events = $this->getSubscribedEvents();
        $events->shouldHaveKey(Events::SET_PAROKI);
    }

    public function it_should_update_baptis_object(
        SetParokiEvent $event,
        Baptis $baptis,
        Updater $updater
    ) {
        $updater->update($baptis)->shouldBeCalledTimes(1);

        $event->getEntity()->willReturn(new \stdClass());
        $this->onSetParoki($event);

        $event->getEntity()->willReturn($baptis);
        $this->onSetParoki($event);
    }

    public function its_preUpdate_should_update_baptis(
        LifecycleEventArgs $args,
        Baptis $entity,
        Updater $updater
    ) {
        $updater->update($entity)->shouldBeCalledTimes(1);

        $args->getObject()->willReturn(new \stdClass());
        $this->preUpdate($args);

        $args->getObject()->willReturn($entity);
        $this->preUpdate($args);
    }
}
