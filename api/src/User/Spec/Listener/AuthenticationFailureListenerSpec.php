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

namespace Spec\SIAP\User\Listener;

use Lexik\Bundle\JWTAuthenticationBundle\Event\AuthenticationFailureEvent;
use Lexik\Bundle\JWTAuthenticationBundle\Events;
use Lexik\Bundle\JWTAuthenticationBundle\Response\JWTAuthenticationFailureResponse;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;
use SIAP\User\Listener\AuthenticationFailureListener;
use function PHPSTORM_META\type;

class AuthenticationFailureListenerSpec extends ObjectBehavior
{
    public function it_is_initializable()
    {
        $this->shouldHaveType(AuthenticationFailureListener::class);
    }

    public function it_should_subscribe_event_properly()
    {
        $subscribed = $this->getSubscribedEvents();
        $subscribed->shouldHaveKey(Events::AUTHENTICATION_FAILURE);
    }

    public function it_should_handle_authentication_failed_response(
        AuthenticationFailureEvent $event
    ) {
        $event->setResponse(Argument::type(JWTAuthenticationFailureResponse::class));
        $response = $this->onAuthenticationFailureResponse($event);
    }
}
