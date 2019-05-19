<?php

namespace Spec\SIAP\Baptis\Services;

use Doctrine\Common\Persistence\ObjectManager;
use Doctrine\Common\Persistence\ObjectRepository;
use SIAP\Baptis\Entity\Baptis;
use SIAP\Baptis\Services\BaptisManager;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;

class BaptisManagerSpec extends ObjectBehavior
{
    function let(
        ObjectManager $manager,
        ObjectRepository $repository
    )
    {
        $manager->getRepository(Argument::any())->willReturn($repository);
        $this->beConstructedWith($manager);
    }

    function it_is_initializable()
    {
        $this->shouldHaveType(BaptisManager::class);
    }

    function it_should_create_new_baptis()
    {
        $this->create()->shouldHaveType(Baptis::class);
    }

    function it_should_find_by_kode_baptis(
        ObjectRepository $repository,
        Baptis $baptis
    )
    {
        $repository->findOneBy(['kodeBaptis' => 'kode'])
            ->shouldBeCalled()
            ->willReturn($baptis);

        $this->findOneByKodeBaptis('kode')
            ->shouldReturn($baptis);
    }

    function its_update_baptis_entity(
        ObjectManager $manager,
        Baptis $baptis
    )
    {
        $manager->persist($baptis)->shouldBeCalled();
        $manager->flush()->shouldBeCalled();

        $this->update($baptis);
    }

    function its_update_not_flush_data_with_andFlush_false(
        ObjectManager $manager,
        Baptis $baptis
    )
    {
        $manager->persist($baptis)->shouldBeCalled(2);
        $manager->flush()->shouldNotBeCalled();

        $this->update($baptis, false);
    }

    function its_delete_should_remove_baptis_entity(
        ObjectManager $manager,
        Baptis $entity
    )
    {
        $manager->remove($entity)->shouldBeCalled();
        $manager->flush()->shouldBeCalled();

        $this->delete($entity);
    }
}
