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

class Keuskupan
{
    private $noUrut;

    private $nama;

    private $namaLatin;

    private $alamat;

    private $kota;

    private $telepon;

    private $fax;

    private $website;

    private $email;

    private $namaUskupSaatIni;

    private $kode;

    private $id;

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

    public function getNamaLatin(): ?string
    {
        return $this->namaLatin;
    }

    public function setNamaLatin(?string $namaLatin): self
    {
        $this->namaLatin = $namaLatin;

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

    public function getNamaUskupSaatIni(): ?string
    {
        return $this->namaUskupSaatIni;
    }

    public function setNamaUskupSaatIni(?string $namaUskupSaatIni): self
    {
        $this->namaUskupSaatIni = $namaUskupSaatIni;

        return $this;
    }

    public function getId(): ?string
    {
        return $this->id;
    }

}
