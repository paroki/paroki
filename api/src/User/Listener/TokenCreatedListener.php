<?php


namespace SIAP\User\Listener;


use Lexik\Bundle\JWTAuthenticationBundle\Event\JWTCreatedEvent;
use Lexik\Bundle\JWTAuthenticationBundle\Events;
use SIAP\User\Services\UserManager;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class TokenCreatedListener implements EventSubscriberInterface
{
    /**
     * @var UserManager
     */
    private $manager;

    public function __construct(
        UserManager $manager
    )
    {
        $this->manager = $manager;
    }

    public static function getSubscribedEvents()
    {
        return [
            Events::JWT_CREATED => 'onCreated'
        ];
    }

    public function onCreated(JWTCreatedEvent $event)
    {
        /* @var \SIAP\User\Entity\User $user */
        $user = $event->getUser();
        $payload = $event->getData();
        $payload['id'] = $user->getId();

        $event->setData($payload);

    }
}
