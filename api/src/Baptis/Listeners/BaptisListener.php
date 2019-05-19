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

use SIAP\Baptis\Entity\Baptis;
use SIAP\Reference\Events as ReferenceEvents;
use SIAP\Reference\Events\SetParokiEvent;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class BaptisListener implements EventSubscriberInterface
{
    public static function getSubscribedEvents()
    {
        return [
            ReferenceEvents::SET_PAROKI => ['onSetParoki', 1000],
        ];
    }

    public function onSetParoki(SetParokiEvent $event)
    {
        /** @var \SIAP\Baptis\Entity\Baptis $entity */
        $entity = $event->getEntity();
        $paroki = $entity->getParoki();

        if (!$entity instanceof Baptis) {
            return;
        }

        $kode = [$paroki->getKode()];

        if (null !== $entity->getBuku()) {
            $kode[] = $entity->getBuku();
        }

        if (null !== $entity->getHalaman()) {
            $kode[] = $entity->getHalaman();
        }

        if (null !== $entity->getNomor()) {
            $kode[] = $entity->getNomor();
        }

        if (null !== $entity->getLanjutan()) {
            $kode[] = $entity->getLanjutan();
        }

        $entity->setKodeBaptis(implode('.', $kode));
    }
}
