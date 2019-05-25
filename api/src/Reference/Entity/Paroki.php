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

namespace SIAP\Reference\Entity;

/**
 * Class Paroki.
 */
class Paroki
{
    private $noUrut;

    private $nama;

    private $namaGereja;

    private $alamat;

    private $kota;

    private $telepon;

    private $fax;

    private $website;

    private $email;

    private $pastor;

    private $wilayahKeuskupan;

    /**
     * @var string
     */
    private $kode;

    /**
     * @var Keuskupan
     */
    protected $keuskupan;

    private $id;

    public function __toString()
    {
        return $this->getNama().' / '.$this->getNamaGereja();
    }

    public function getKode(): ?string
    {
        return $this->kode;
    }

    public function setKode(string $kode): self
    {
        $this->kode = $kode;

        return $this;
    }

    public function getNoUrut(): ?int
    {
        return $this->noUrut;
    }

    public function setNoUrut(?int $noUrut): self
    {
        $this->noUrut = $noUrut;

        return $this;
    }

    public function getNama(): ?string
    {
        return $this->nama;
    }

    public function setNama(?string $nama): self
    {
        $this->nama = $nama;

        return $this;
    }

    public function getNamaGereja(): ?string
    {
        return $this->namaGereja;
    }

    public function setNamaGereja(?string $namaGereja): self
    {
        $this->namaGereja = $namaGereja;

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

    public function getKota(): ?string
    {
        return $this->kota;
    }

    public function setKota(?string $kota): self
    {
        $this->kota = $kota;

        return $this;
    }

    public function getTelepon(): ?string
    {
        return $this->telepon;
    }

    public function setTelepon(?string $telepon): self
    {
        $this->telepon = $telepon;

        return $this;
    }

    public function getFax(): ?string
    {
        return $this->fax;
    }

    public function setFax(?string $fax): self
    {
        $this->fax = $fax;

        return $this;
    }

    public function getWebsite(): ?string
    {
        return $this->website;
    }

    public function setWebsite(?string $website): self
    {
        $this->website = $website;

        return $this;
    }

    public function getEmail(): ?string
    {
        return $this->email;
    }

    public function setEmail(?string $email): self
    {
        $this->email = $email;

        return $this;
    }

    public function getPastor(): ?string
    {
        return $this->pastor;
    }

    public function setPastor(?string $pastor): self
    {
        $this->pastor = $pastor;

        return $this;
    }

    public function getWilayahKeuskupan(): ?string
    {
        return $this->wilayahKeuskupan;
    }

    public function setWilayahKeuskupan(?string $wilayahKeuskupan): self
    {
        $this->wilayahKeuskupan = $wilayahKeuskupan;

        return $this;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getKeuskupan(): ?Keuskupan
    {
        return $this->keuskupan;
    }

    public function setKeuskupan(?Keuskupan $keuskupan): self
    {
        $this->keuskupan = $keuskupan;

        return $this;
    }
}
