<?php

namespace Spec\SIAP\User\Listener;

use Lexik\Bundle\JWTAuthenticationBundle\Event\JWTCreatedEvent;
use Lexik\Bundle\JWTAuthenticationBundle\Events;
use SIAP\User\Entity\User;
use SIAP\User\Listener\TokenCreatedListener;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;
use SIAP\User\Services\UserManager;

class TokenCreatedListenerSpec extends ObjectBehavior
{
    function let(
        UserManager $manager
    )
    {
        $this->beConstructedWith($manager);
    }

    function it_is_initializable()
    {
        $this->shouldHaveType(TokenCreatedListener::class);
    }

    function it_should_susbscribed_to_events()
    {
        $subscribed = $this->getSubscribedEvents();
        $subscribed->shouldHaveKey(Events::JWT_CREATED);
    }

    function it_should_add_info_on_created_token(
        JWTCreatedEvent $event,
        User $user
    )
    {
        $user->getId()->willReturn('some-id');
        $event->getUser()->willReturn($user);
        $event->getData()->willReturn([]);

        $event->setData(['id' => 'some-id'])
            ->shouldBeCalled();

        $this->onCreated($event);
    }
}
