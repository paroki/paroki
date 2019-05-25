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

namespace Spec\SIAP\Core\Entity;

use PhpSpec\ObjectBehavior;
use SIAP\Core\Entity\MediaObject;
use SIAP\Core\Test\MutableSpecTrait;
use SIAP\User\Entity\User;

class MediaObjectSpec extends ObjectBehavior
{
    use MutableSpecTrait;

    public function it_is_initializable()
    {
        $this->shouldHaveType(MediaObject::class);
    }

    public function getMutableProperties()
    {
        return [
            'id'           => null,
            'nama'         => '',
            'filePath'     => '',
            'urlPrefix'    => '',
            'catatan'      => '',
            'uploadedBy'   => new User(),
            'uploadedAt'   => new \DateTimeImmutable(),
            'originalName' => '',
            'mimeType'     => '',
            'size'         => 10,
            'dimensions'   => ['some'],
        ];
    }

    public function getMutableClassToTest()
    {
        return MediaObject::class;
    }

    public function its_contentUrl_should_generated_automatically(
    ) {
        $now = new \DateTimeImmutable();

        $this->setUrlPrefix('/url/prefix')
            ->setFilePath('some.path');

        $this->getContentUrl()->shouldReturn('/url/prefix/some.path?t='.$now->format('Y-m-d-H-i-s'));
    }
}
