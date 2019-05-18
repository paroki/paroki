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

namespace SIAP\Core\Entity;

class AbstractBiodata
{
    /**
     * @var string|null
     */
    private $nama;

    /**
     * @var int|null
     */
    private $jenisKelamin;

    /**
     * @var string|null
     */
    private $tempatLahir;

    /**
     * @var \DateTimeInterface|null
     */
    private $tanggalLahir;

    /**
     * @var string|null
     */
    private $ayah;

    /**
     * @var string|null
     */
    private $ibu;

    /**
     * @var string|null
     */
    private $alamat;

    public function getNama(): ?string
    {
        return $this->nama;
    }

    public function setNama(string $nama): self
    {
        $this->nama = $nama;

        return $this;
    }

    public function getJenisKelamin(): ?int
    {
        return $this->jenisKelamin;
    }

    public function setJenisKelamin(int $jenisKelamin): self
    {
        $this->jenisKelamin = $jenisKelamin;

        return $this;
    }

    public function getTempatLahir(): ?string
    {
        return $this->tempatLahir;
    }

    public function setTempatLahir(?string $tempatLahir): self
    {
        $this->tempatLahir = $tempatLahir;

        return $this;
    }

    public function getTanggalLahir(): ?\DateTimeInterface
    {
        return $this->tanggalLahir;
    }

    public function setTanggalLahir(?\DateTimeInterface $tanggalLahir): self
    {
        $this->tanggalLahir = $tanggalLahir;

        return $this;
    }

    public function getAyah(): ?string
    {
        return $this->ayah;
    }

    public function setAyah(?string $ayah): self
    {
        $this->ayah = $ayah;

        return $this;
    }

    public function getIbu(): ?string
    {
        return $this->ibu;
    }

    public function setIbu(?string $ibu): self
    {
        $this->ibu = $ibu;

        return $this;
    }

    public function getAlamat(): ?string
    {
        return $this->alamat;
    }

    public function setAlamat(?string $alamat): self
    {
        $this->alamat = $alamat;

        return $this;
    }
}
