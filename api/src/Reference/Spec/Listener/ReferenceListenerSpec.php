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

namespace Spec\SIAP\Reference\Listener;

use Doctrine\Common\Persistence\Event\LifecycleEventArgs;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;
use SIAP\Reference\Entity\Paroki;
use SIAP\Reference\Entity\RequireParokiInterface;
use SIAP\Reference\Listener\ReferenceListener;
use SIAP\User\Entity\User;
use Symfony\Component\Security\Core\Authentication\Token\Storage\TokenStorageInterface;
use Symfony\Component\Security\Core\Authentication\Token\TokenInterface;

class ReferenceListenerSpec extends ObjectBehavior
{
    public function let(
        TokenStorageInterface $tokenStorage,
        Paroki $paroki,
        User $user,
        TokenInterface $token
    ) {
        $tokenStorage->getToken()->willReturn($token);
        $token->getUser()->willReturn($user);
        $user->getParoki()->willReturn($paroki);
        $paroki->getKode()->willReturn('some');
        $this->beConstructedWith($tokenStorage);
    }

    public function it_is_initializable()
    {
        $this->shouldHaveType(ReferenceListener::class);
    }

    public function it_should_set_paroki_using_user_paroki(
        LifecycleEventArgs $args,
        Paroki $paroki,
        RequireParokiInterface $entity
    ) {
        $entity->getParoki()->willReturn(null);
        $entity->setParoki($paroki)
            ->shouldBeCalled();

        $args->getObject()->willReturn($entity);

        $this->prePersist($args);
    }

    public function it_should_not_set_paroki_when_paroki_not_null(
        LifecycleEventArgs $args,
        RequireParokiInterface $entity,
        Paroki $paroki
    ) {
        $entity->getParoki()->willReturn($paroki);
        $entity->setParoki(Argument::any())
            ->shouldNotBeCalled();

        $args->getObject()->willReturn($entity);

        $this->prePersist($args);
    }

    public function it_should_not_set_paroki_when_user_paroki_is_null(
        TokenStorageInterface $tokenStorage,
        TokenInterface $token,
        User $user,
        RequireParokiInterface $entity,
        LifecycleEventArgs $args
    ) {
        $tokenStorage->getToken()->willReturn($token);
        $token->getUser()->willReturn($user);
        $user->getParoki()->willReturn(null);

        $entity->getParoki()->willReturn(null);
        $entity->setParoki(Argument::any())
            ->shouldNotBeCalled();

        $args->getObject()->willReturn($entity);

        $this->beConstructedWith($tokenStorage);
        $this->prePersist($args);
    }
}
