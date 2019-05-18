<?php


namespace SIAP\Reference\Events;


use SIAP\Reference\Entity\RequireParokiInterface;
use Symfony\Component\EventDispatcher\Event;

class SetParokiEvent extends Event
{
    /**
     * @var RequireParokiInterface
     */
    private $entity;

    public function __construct(
        RequireParokiInterface $entity
    )
    {
        $this->entity = $entity;
    }

    /**
     * @return RequireParokiInterface
     */
    public function getEntity()
    {
        return $this->entity;
    }
}
