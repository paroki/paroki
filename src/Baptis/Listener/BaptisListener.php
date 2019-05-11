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

namespace SIAP\Baptis\Listener;

use Doctrine\Common\EventSubscriber;
use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use Doctrine\ORM\Events;
use SIAP\Baptis\Entity\Baptis;

class BaptisListener implements EventSubscriber
{
    public function getSubscribedEvents()
    {
        return [
            Events::prePersist,
            Events::preUpdate,
        ];
    }

    public function prePersist(LifecycleEventArgs $args)
    {
        $this->updateBaptisId($args);
    }

    public function preUpdate(LifecycleEventArgs $args)
    {
        return $this->updateBaptisId($args);
    }

    public function updateBaptisId(LifecycleEventArgs $args)
    {
        /** @var Baptis $entity */
        $entity = $args->getObject();

        if (!$entity instanceof Baptis) {
            return;
        }

        $exp = [
            $entity->getParoki()->getKode(),
            $entity->getBuku(),
            $entity->getHalaman(),
            $entity->getNomor(),
        ];

        $kode = trim(implode('.', $exp).$entity->getLanjutan());

        $entity->setKodeBaptis($kode);

        // move this into somewhere else
        $entity->setUpdatedAt(new \DateTime());
    }
}
