<?php


namespace SIAP\User\Listener;


use Lexik\Bundle\JWTAuthenticationBundle\Event\AuthenticationFailureEvent;
use Lexik\Bundle\JWTAuthenticationBundle\Events;
use Lexik\Bundle\JWTAuthenticationBundle\Response\JWTAuthenticationFailureResponse;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;

class AuthenticationFailureListener implements EventSubscriberInterface
{
    public static function getSubscribedEvents()
    {
        return [
            Events::AUTHENTICATION_FAILURE => ['onAuthenticationFailureResponse',1000]
        ];
    }

    public function onAuthenticationFailureResponse(AuthenticationFailureEvent $event)
    {
        $data = [
            'status'  => '401 Unauthorized',
            'message' => 'Username atau password anda salah, periksa kembali username dan password yang anda masukkan.',
        ];


        $response = new JWTAuthenticationFailureResponse($data);

        $event->setResponse($response);
    }
}
