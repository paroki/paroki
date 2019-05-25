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

namespace Spec\SIAP\User\Entity;

use PhpSpec\ObjectBehavior;
use Ramsey\Uuid\Uuid;
use SIAP\Core\Entity\MediaObject;
use SIAP\Core\Test\MutableSpecTrait;
use SIAP\Reference\Entity\Paroki;
use SIAP\User\Entity\User;
use Symfony\Component\HttpFoundation\File\File;

class UserSpec extends ObjectBehavior
{
    use MutableSpecTrait;

    public function it_is_initializable()
    {
        $this->shouldHaveType(User::class);
    }

    public function its_id_should_be_null_by_default()
    {
        $this->getId()->shouldReturn(null);
    }

    public function getMutableProperties()
    {
        return [
            'nama' => 'some',
            'fotoFile' => new File(__FILE__),
            'foto' => new MediaObject(),
            'paroki' => new Paroki(),
            'currentPassword' => 'some',
            'id' => null,
            'updatedAt' => new \DateTimeImmutable()
        ];
    }

    public function getMutableClassToTest()
    {
        return User::class;
    }


}
