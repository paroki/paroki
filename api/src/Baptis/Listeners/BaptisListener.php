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

namespace SIAP\Baptis\Listeners;

use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use SIAP\Baptis\Entity\Baptis;
use SIAP\Baptis\Services\Updater;
use SIAP\Reference\Events as ReferenceEvents;
use SIAP\Reference\Events\SetParokiEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class BaptisListener implements EventSubscriberInterface
{
    /**
     * @var Updater
     */
    private $updater;

    /**
     * BaptisListener constructor.
     */
    public function __construct(
        Updater $updater
    ) {
        $this->updater = $updater;
    }

    public static function getSubscribedEvents()
    {
        return [
            ReferenceEvents::SET_PAROKI => ['onSetParoki', 1000],
        ];
    }

    public function preUpdate(LifecycleEventArgs $args)
    {
        $entity = $args->getObject();

        if (!$entity instanceof Baptis) {
            return;
        }

        $this->updater->update($entity);
    }

    public function onSetParoki(SetParokiEvent $event)
    {
        /** @var \SIAP\Baptis\Entity\Baptis $entity */
        $entity = $event->getEntity();

        if (!$entity instanceof Baptis) {
            return;
        }

        $this->updater->update($entity);
    }
}
