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

return [
    Symfony\Bundle\FrameworkBundle\FrameworkBundle::class                      => ['all' => true],
    Symfony\Bundle\TwigBundle\TwigBundle::class                                => ['all' => true],
    Symfony\Bundle\SecurityBundle\SecurityBundle::class                        => ['all' => true],
    Doctrine\Bundle\DoctrineCacheBundle\DoctrineCacheBundle::class             => ['all' => true],
    Doctrine\Bundle\DoctrineBundle\DoctrineBundle::class                       => ['all' => true],
    SIAP\Baptis\BaptisBundle::class                                            => ['all' => true],
    SIAP\Core\CoreBundle::class                                                => ['all' => true],
    SIAP\Reference\ReferenceBundle::class                                      => ['all' => true],
    SIAP\User\UserBundle::class                                                => ['all' => true],
    Symfony\Bundle\MakerBundle\MakerBundle::class                              => ['dev' => true],
    Nelmio\CorsBundle\NelmioCorsBundle::class                                  => ['all' => true],
    ApiPlatform\Core\Bridge\Symfony\Bundle\ApiPlatformBundle::class            => ['all' => true],
    Symfony\WebpackEncoreBundle\WebpackEncoreBundle::class                     => ['all' => true],
    Nelmio\Alice\Bridge\Symfony\NelmioAliceBundle::class                       => ['dev' => true, 'test' => true],
    Fidry\AliceDataFixtures\Bridge\Symfony\FidryAliceDataFixturesBundle::class => ['dev' => true, 'test' => true],
    Hautelook\AliceBundle\HautelookAliceBundle::class                          => ['dev' => true, 'test' => true],
    Lexik\Bundle\JWTAuthenticationBundle\LexikJWTAuthenticationBundle::class   => ['all' => true],
    Symfony\Bundle\WebProfilerBundle\WebProfilerBundle::class                  => ['dev' => true, 'test' => true],
    Symfony\Bundle\WebServerBundle\WebServerBundle::class                      => ['dev' => true],
    Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle::class                  => ['all' => true],
    FOS\UserBundle\FOSUserBundle::class                                        => ['all' => true],
];
