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

namespace Spec\SIAP\Baptis\Entity;

use PhpSpec\ObjectBehavior;
use SIAP\Baptis\Entity\Baptis;
use SIAP\Baptis\Entity\BaptisKomuni;
use SIAP\Baptis\Entity\BaptisKrisma;
use SIAP\Baptis\Entity\BaptisPerkawinan;
use SIAP\Baptis\Entity\Diterima;
use SIAP\Core\Entity\Dokumen;
use SIAP\Core\Test\MutableSpecTrait;
use SIAP\Reference\Entity\Agama;
use SIAP\Reference\Entity\Lingkungan;
use SIAP\Reference\Entity\Paroki;
use SIAP\User\Entity\User;

class BaptisSpec extends ObjectBehavior
{
    use MutableSpecTrait;

    public function it_is_initializable()
    {
        $this->shouldHaveType(Baptis::class);
    }

    public function getMutableClassToTest()
    {
        return Baptis::class;
    }

    public function getMutableProperties()
    {
        return [
            // biodata properties
            'nama'         => 'nama',
            'tempatLahir'  => 'tempat lahir',
            'tanggalLahir' => new \DateTime(),
            'jenisKelamin' => 1,
            'ayah'         => 'ayah',
            'ibu'          => 'ibu',
            'alamat'       => 'alamat',

            // baptis properties
            'id'                 => null,
            'kodeBaptis'         => 'some-data',
            'buku'               => 'some-data',
            'halaman'            => 0,
            'nomor'              => 1,
            'lanjutan'           => 'some-data',
            'namaBaptis'         => 'nama',
            'tempatBaptis'       => 'nama',
            'tanggalBaptis'      => new \DateTime(),
            'waliBaptis1'        => 'some-data',
            'waliBaptis2'        => 'some-data',
            'catatan'            => 'some-data',
            'updatedAt'          => new \DateTime(),
            'komuni'             => new BaptisKomuni(),
            'krisma'             => new BaptisKrisma(),
            'perkawinan'         => new BaptisPerkawinan(),
            'diterima'           => new Diterima(),
            'updatedBy'          => new User(),
            'paroki'             => new Paroki(),
            'agamaSebelumBaptis' => new Agama(),
            'dokumen'            => new Dokumen(),
            'lingkungan'         => new Lingkungan(),
        ];
    }
}
