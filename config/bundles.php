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
    Symfony\Bundle\FrameworkBundle\FrameworkBundle::class            => ['all' => true],
    Symfony\Bundle\TwigBundle\TwigBundle::class                      => ['all' => true],
    Symfony\Bundle\SecurityBundle\SecurityBundle::class              => ['all' => true],
    FOS\UserBundle\FOSUserBundle::class                              => ['all' => true],
    Doctrine\Bundle\DoctrineCacheBundle\DoctrineCacheBundle::class   => ['all' => true],
    Doctrine\Bundle\DoctrineBundle\DoctrineBundle::class             => ['all' => true],
    Doctrine\Bundle\MigrationsBundle\DoctrineMigrationsBundle::class => ['all' => true],
    Symfony\Bundle\SwiftmailerBundle\SwiftmailerBundle::class        => ['all' => true],
    Paroki\Baptis\BaptisBundle::class                                => ['all' => true],
    Paroki\Core\CoreBundle::class                                    => ['all' => true],
    Paroki\Reference\ReferenceBundle::class                          => ['all' => true],
    Paroki\User\UserBundle::class                                    => ['all' => true],
    Symfony\Bundle\MakerBundle\MakerBundle::class                    => ['dev' => true],
    Nelmio\CorsBundle\NelmioCorsBundle::class                        => ['all' => true],
    ApiPlatform\Core\Bridge\Symfony\Bundle\ApiPlatformBundle::class  => ['all' => true],
    Symfony\WebpackEncoreBundle\WebpackEncoreBundle::class           => ['all' => true],
];
