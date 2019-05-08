<?php

namespace Paroki\Baptis\Entity;

use Paroki\Reference\Entity\Paroki;

class BaptisKrisma
{
    private $nama;

    private $tempat;

    private $tanggal;

    private $pemberi;

    private $catatan;

    private $id;

    private $baptis;

    private $paroki;

    public function getNama(): ?string
    {
        return $this->nama;
    }

    public function setNama(?string $nama): self
    {
        $this->nama = $nama;

        return $this;
    }

    public function getTempat(): ?string
    {
        return $this->tempat;
    }

    public function setTempat(?string $tempat): self
    {
        $this->tempat = $tempat;

        return $this;
    }

    public function getTanggal(): ?string
    {
        return $this->tanggal;
    }

    public function setTanggal(?string $tanggal): self
    {
        $this->tanggal = $tanggal;

        return $this;
    }

    public function getPemberi(): ?string
    {
        return $this->pemberi;
    }

    public function setPemberi(?string $pemberi): self
    {
        $this->pemberi = $pemberi;

        return $this;
    }

    public function getCatatan(): ?string
    {
        return $this->catatan;
    }

    public function setCatatan(?string $catatan): self
    {
        $this->catatan = $catatan;

        return $this;
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    public function getBaptis(): ?Baptis
    {
        return $this->baptis;
    }

    public function setBaptis(?Baptis $baptis): self
    {
        $this->baptis = $baptis;

        // set (or unset) the owning side of the relation if necessary
        $newKrisma = $baptis === null ? null : $this;
        if ($newKrisma !== $baptis->getKrisma()) {
            $baptis->setKrisma($newKrisma);
        }

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
}
