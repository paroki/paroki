<?php

namespace Spec\SIAP\User\Listener;

use Lexik\Bundle\JWTAuthenticationBundle\Event\AuthenticationFailureEvent;
use Lexik\Bundle\JWTAuthenticationBundle\Events;
use Lexik\Bundle\JWTAuthenticationBundle\Response\JWTAuthenticationFailureResponse;
use function PHPSTORM_META\type;
use SIAP\User\Listener\AuthenticationFailureListener;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class AuthenticationFailureListenerSpec extends ObjectBehavior
{
    function it_is_initializable()
    {
        $this->shouldHaveType(AuthenticationFailureListener::class);
    }

    function it_should_subscribe_event_properly()
    {
        $subscribed = $this->getSubscribedEvents();
        $subscribed->shouldHaveKey(Events::AUTHENTICATION_FAILURE);
    }

    function it_should_handle_authentication_failed_response(
        AuthenticationFailureEvent $event
    )
    {
        $event->setResponse(Argument::type(JWTAuthenticationFailureResponse::class));
        $response = $this->onAuthenticationFailureResponse($event);
    }
}
