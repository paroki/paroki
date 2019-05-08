<?php


namespace Paroki\Baptis\Listener;


use Doctrine\Common\EventSubscriber;
use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use Doctrine\ORM\Events;
use Paroki\Baptis\Entity\Baptis;

class BaptisListener implements EventSubscriber
{
    public function getSubscribedEvents()
    {
        return [
            Events::prePersist,
            Events::preUpdate
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
        /* @var Baptis $entity */
        $entity = $args->getObject();

        if(!$entity instanceof Baptis){
            return;
        }

        $exp = array(
            $entity->getParoki()->getKode(),
            $entity->getBuku(),
            $entity->getHalaman(),
            $entity->getNomor()
        );

        $kode = trim(implode('.',$exp).$entity->getLanjutan());

        $entity->setKodeBaptis($kode);

        // move this into somewhere else
        $entity->setUpdatedAt(new \DateTime());
    }
}
