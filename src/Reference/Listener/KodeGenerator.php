<?php


namespace Paroki\Reference\Listener;


use Doctrine\Common\EventSubscriber;
use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use Doctrine\ORM\Events;
use Paroki\Reference\Entity\Lingkungan;
use Ramsey\Uuid\Uuid;

class KodeGenerator implements EventSubscriber
{
    public function getSubscribedEvents()
    {
        return [
            Events::prePersist,
            Events::postPersist
        ];
    }

    public function prePersist(LifecycleEventArgs $args)
    {
        $this->doProcess($args);
    }

    public function postPersist(LifecycleEventArgs $args)
    {
        $this->doProcess($args);
    }

    /**
     * @param LifecycleEventArgs $args
     */
    private function doProcess(LifecycleEventArgs $args)
    {
        $entity = $args->getObject();
        if($entity instanceof Lingkungan){
            $this->generateLingkunganId($entity, $args);
        }

        if(method_exists($entity,'setGuid')){
            $entity->setGuid(Uuid::uuid4());
        }
    }

    private function generateLingkunganId(Lingkungan $entity, LifecycleEventArgs $args)
    {
        $kode = implode('.',[
            $entity->getParoki()->getKode(),
            $entity->getKode()
        ]);
        $entity->setId($kode);
    }

}
