<?php

namespace Spec\SIAP\Baptis\Entity;

use SIAP\Baptis\Entity\Baptis;
use PhpSpec\ObjectBehavior;
use Prophecy\Argument;
use SIAP\Baptis\Entity\BaptisKomuni;
use SIAP\Baptis\Entity\BaptisKrisma;
use SIAP\Baptis\Entity\BaptisPerkawinan;
use SIAP\Baptis\Entity\Diterima;
use SIAP\Core\Entity\Dokumen;
use SIAP\Core\Test\MutableSpecTrait;
use SIAP\Reference\Entity\Agama;
use SIAP\Reference\Entity\Paroki;
use SIAP\User\Entity\User;

class BaptisSpec extends ObjectBehavior
{
    use MutableSpecTrait;

    function it_is_initializable()
    {
        $this->shouldHaveType(Baptis::class);
    }

    function getReadableProperties()
    {
        return [
            'id'
        ];
    }

    function getMutableClassToTest()
    {
        return Baptis::class;
    }

    function getMutableProperties()
    {
        return [
            // biodata properties
            'nama' => 'nama',
            'tempatLahir' => 'tempat lahir',
            'tanggalLahir' => new \DateTime(),
            'jenisKelamin' => 1,
            'ayah' => 'ayah',
            'ibu' => 'ibu',
            'alamat' => 'alamat',

            // baptis properties
            'kodeBaptis' => null,
            'buku' => null,
            'halaman' => 0,
            'nomor' => 1,
            'lanjutan' => null,
            'namaBaptis' => 'nama',
            'tempatBaptis' => 'nama',
            'tanggalBaptis' => new \DateTime(),
            'waliBaptis1' => null,
            'waliBaptis2' => null,
            'catatan' => null,
            'updatedAt' => new \DateTime(),
            'komuni' => new BaptisKomuni(),
            'krisma' => new BaptisKrisma(),
            'perkawinan' => new BaptisPerkawinan(),
            'diterima' => new Diterima(),
            'updatedBy' => new User(),
            'paroki' => new Paroki(),
            'agamaSebelumBaptis' => new Agama(),
            'dokumen' => new Dokumen()
        ];
    }
}
