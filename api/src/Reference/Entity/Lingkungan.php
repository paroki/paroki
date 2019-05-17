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

class Lingkungan implements RequireParokiInterface
{
    /**
     * @var string
     */
    private $kode;

    private $nama;

    private $noUrut;

    private $ketua;

    private $f5;

    private $id;

    private $wilayah;

    private $bagian;

    private $paroki;

    public function setId(string $id): self
    {
        $this->id = $id;

        return $this;
    }

    public function getF5(): ?string
    {
        return $this->f5;
    }

    public function setF5(?string $f5): self
    {
        $this->f5 = $f5;

        return $this;
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    public function getWilayah(): ?Wilayah
    {
        return $this->wilayah;
    }

    public function setWilayah(?Wilayah $wilayah): self
    {
        $this->wilayah = $wilayah;

        return $this;
    }

    public function getBagian(): ?JenisWilayah
    {
        return $this->bagian;
    }

    public function setBagian(?JenisWilayah $bagian): self
    {
        $this->bagian = $bagian;

        return $this;
    }

    public function getKode(): ?string
    {
        return $this->kode;
    }

    public function setKode(?string $kode): self
    {
        $this->kode = $kode;

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

    public function getNoUrut(): ?int
    {
        return $this->noUrut;
    }

    public function setNoUrut(?int $noUrut): self
    {
        $this->noUrut = $noUrut;

        return $this;
    }

    public function getKetua(): ?string
    {
        return $this->ketua;
    }

    public function setKetua(?string $ketua): self
    {
        $this->ketua = $ketua;

        return $this;
    }

    public function getParoki(): ?Paroki
    {
        return $this->paroki;
    }

    public function setParoki(?Paroki $paroki): self
    {
        $this->paroki = $paroki;

        return $this;
    }

    public function getKodeWilayah(): ?string
    {
        return $this->kodeWilayah;
    }

    public function setKodeWilayah(string $kodeWilayah): self
    {
        $this->kodeWilayah = $kodeWilayah;

        return $this;
    }
}
