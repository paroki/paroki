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

namespace Paroki\Reference\Entity;

class Lingkungan
{
    private $LingkunganID;

    private $NoLingkungan;

    private $NamaKetuaLingkungan;

    private $F5;

    private $KodeWLID;

    private $wilayah;

    private $bagian;

    public function getLingkunganID(): ?string
    {
        return $this->LingkunganID;
    }

    public function setLingkunganID(?string $LingkunganID): self
    {
        $this->LingkunganID = $LingkunganID;

        return $this;
    }

    public function getNoLingkungan(): ?int
    {
        return $this->NoLingkungan;
    }

    public function setNoLingkungan(?int $NoLingkungan): self
    {
        $this->NoLingkungan = $NoLingkungan;

        return $this;
    }

    public function getNamaKetuaLingkungan(): ?string
    {
        return $this->NamaKetuaLingkungan;
    }

    public function setNamaKetuaLingkungan(?string $NamaKetuaLingkungan): self
    {
        $this->NamaKetuaLingkungan = $NamaKetuaLingkungan;

        return $this;
    }

    public function getF5(): ?string
    {
        return $this->F5;
    }

    public function setF5(?string $F5): self
    {
        $this->F5 = $F5;

        return $this;
    }

    public function getKodeWLID(): ?string
    {
        return $this->KodeWLID;
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

    public function getBagian(): ?WilayahBagian
    {
        return $this->bagian;
    }

    public function setBagian(?WilayahBagian $bagian): self
    {
        $this->bagian = $bagian;

        return $this;
    }
}
