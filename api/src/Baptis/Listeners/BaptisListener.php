<?php


namespace SIAP\Baptis\Listeners;


use SIAP\Baptis\Entity\Baptis;
use SIAP\Reference\Events as ReferenceEvents;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use SIAP\Reference\Events\SetParokiEvent;

class BaptisListener implements EventSubscriberInterface
{
    public static function getSubscribedEvents()
    {
        return [
            ReferenceEvents::SET_PAROKI => ['onSetParoki',1000]
        ];
    }

    public function onSetParoki(SetParokiEvent $event)
    {
        /* @var \SIAP\Baptis\Entity\Baptis $entity */
        $entity = $event->getEntity();
        $paroki = $entity->getParoki();

        if(!$entity instanceof Baptis){
            return;
        }

        $kode = [$paroki->getKode()];

        if(!is_null($entity->getBuku())){
            $kode [] = $entity->getBuku();
        }

        if(!is_null($entity->getHalaman())){
            $kode[] = $entity->getHalaman();
        }

        if(!is_null($entity->getNomor())){
            $kode[] = $entity->getNomor();
        }

        if(!is_null($entity->getLanjutan())){
            $kode[] = $entity->getLanjutan();
        }

        $entity->setKodeBaptis(implode('.',$kode));
    }
}
