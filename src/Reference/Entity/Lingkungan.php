<?php

namespace Paroki\Reference\Entity;

class Lingkungan
{
    private $lingkunganId;

    private $noLingkungan;

    private $namaKetuaLingkungan;

    private $f5;

    private $id;

    private $wilayah;

    private $bagian;

    public function getLingkunganId(): ?string
    {
        return $this->lingkunganId;
    }

    public function setLingkunganId(?string $lingkunganId): self
    {
        $this->lingkunganId = $lingkunganId;

        return $this;
    }

    public function getNoLingkungan(): ?int
    {
        return $this->noLingkungan;
    }

    public function setNoLingkungan(?int $noLingkungan): self
    {
        $this->noLingkungan = $noLingkungan;

        return $this;
    }

    public function getNamaKetuaLingkungan(): ?string
    {
        return $this->namaKetuaLingkungan;
    }

    public function setNamaKetuaLingkungan(?string $namaKetuaLingkungan): self
    {
        $this->namaKetuaLingkungan = $namaKetuaLingkungan;

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
