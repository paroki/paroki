<?php

namespace Paroki\Baptis\Entity;

use Paroki\Reference\Entity\Paroki;

class BaptisPerkawinan
{
    private $nomorBuku;

    private $tanggal;

    private $tempat;

    private $menikahDengan;

    private $saksiGereja;

    private $catatan;

    private $id;

    private $baptis;

    private $paroki;

    public function getNomorBuku(): ?string
    {
        return $this->nomorBuku;
    }

    public function setNomorBuku(?string $nomorBuku): self
    {
        $this->nomorBuku = $nomorBuku;

        return $this;
    }

    public function getTanggal(): ?\DateTimeInterface
    {
        return $this->tanggal;
    }

    public function setTanggal(?\DateTimeInterface $tanggal): self
    {
        $this->tanggal = $tanggal;

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

    public function getMenikahDengan(): ?string
    {
        return $this->menikahDengan;
    }

    public function setMenikahDengan(?string $menikahDengan): self
    {
        $this->menikahDengan = $menikahDengan;

        return $this;
    }

    public function getSaksiGereja(): ?string
    {
        return $this->saksiGereja;
    }

    public function setSaksiGereja(?string $saksiGereja): self
    {
        $this->saksiGereja = $saksiGereja;

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
        $newPerkawinan = $baptis === null ? null : $this;
        if ($newPerkawinan !== $baptis->getPerkawinan()) {
            $baptis->setPerkawinan($newPerkawinan);
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
