<?php


namespace SIAP\Core\Listener;

use Doctrine\Common\EventSubscriber;
use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Vich\UploaderBundle\Storage\StorageInterface;
use Doctrine\ORM\Events;

class MediaObjectListener implements EventSubscriber
{
    private $tokenStorage;

    private $storage;

    public function __construct(
        TokenStorageInterface $tokenStorage,
        StorageInterface $storage
    )
    {
        $this->tokenStorage = $tokenStorage;
        $this->storage = $storage;
    }

    public function getSubscribedEvents()
    {
        return [
            Events::prePersist,
            Events::preUpdate,
        ];
    }

    public function prePersist(LifecycleEventArgs $args)
    {
        $entity = $args->getObject();

        if(false === strpos(get_class($entity),'MediaObject')){
            return;
        }

        $this->updateField($entity);
    }

    public function preUpdate(LifecycleEventArgs $args)
    {
    }

    private function updateField($object)
    {
    }
}
