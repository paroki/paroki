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

namespace SIAP\Reference\Listener;

use Doctrine\Common\EventSubscriber;
use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use Doctrine\ORM\Events;
use Ramsey\Uuid\Uuid;
use SIAP\Reference\Entity\Lingkungan;

class KodeGenerator implements EventSubscriber
{
    public function getSubscribedEvents()
    {
        return [
            Events::prePersist,
            Events::postPersist,
        ];
    }

    public function prePersist(LifecycleEventArgs $args)
    {
        $this->doProcess($args, Events::prePersist);
    }

    public function postPersist(LifecycleEventArgs $args)
    {
        $this->doProcess($args, Events::prePersist);
    }

    private function doProcess(LifecycleEventArgs $args, $event)
    {
        $entity = $args->getObject();
        if ($entity instanceof Lingkungan) {
            $this->generateLingkunganId($entity, $args);
        }

        if (method_exists($entity, 'setGuid')) {
            $entity->setGuid(Uuid::uuid4());
        }

        if (method_exists($entity, 'setParoki') && Events::prePersist === $event) {
            $this->setParoki($entity);
        }
    }

    private function generateLingkunganId(Lingkungan $entity, LifecycleEventArgs $args)
    {
        $kode = implode('.', [
            $entity->getParoki()->getKode(),
            $entity->getKode(),
        ]);
        $entity->setId($kode);
    }

    private function setParoki($entity)
    {
    }
}
