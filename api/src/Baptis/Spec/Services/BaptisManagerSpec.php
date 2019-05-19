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

namespace Spec\SIAP\Baptis\Services;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\Persistence\ObjectRepository;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;
use SIAP\Baptis\Entity\Baptis;
use SIAP\Baptis\Services\BaptisManager;

class BaptisManagerSpec extends ObjectBehavior
{
    public function let(
        ObjectManager $manager,
        ObjectRepository $repository
    ) {
        $manager->getRepository(Argument::any())->willReturn($repository);
        $this->beConstructedWith($manager);
    }

    public function it_is_initializable()
    {
        $this->shouldHaveType(BaptisManager::class);
    }

    public function it_should_create_new_baptis()
    {
        $this->create()->shouldHaveType(Baptis::class);
    }

    public function it_should_find_by_kode_baptis(
        ObjectRepository $repository,
        Baptis $baptis
    ) {
        $repository->findOneBy(['kodeBaptis' => 'kode'])
            ->shouldBeCalled()
            ->willReturn($baptis);

        $this->findOneByKodeBaptis('kode')
            ->shouldReturn($baptis);
    }

    public function its_update_baptis_entity(
        ObjectManager $manager,
        Baptis $baptis
    ) {
        $manager->persist($baptis)->shouldBeCalled();
        $manager->flush()->shouldBeCalled();

        $this->update($baptis);
    }

    public function its_update_not_flush_data_with_andFlush_false(
        ObjectManager $manager,
        Baptis $baptis
    ) {
        $manager->persist($baptis)->shouldBeCalled(2);
        $manager->flush()->shouldNotBeCalled();

        $this->update($baptis, false);
    }

    public function its_delete_should_remove_baptis_entity(
        ObjectManager $manager,
        Baptis $entity
    ) {
        $manager->remove($entity)->shouldBeCalled();
        $manager->flush()->shouldBeCalled();

        $this->delete($entity);
    }
}
