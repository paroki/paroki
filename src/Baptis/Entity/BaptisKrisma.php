<?php

namespace Paroki\Baptis\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Paroki\Core\Entity\Dokumen;
use Paroki\Reference\Entity\Paroki;
use Paroki\User\Entity\User;

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

    /**
     * @var string
     */
    private $register;

    /**
     * @var \DateTime
     */
    private $updatedAt;

    /**
     * @var User
     */
    private $updatedBy;

    /**
     * @var Dokumen[]
     */
    private $dokumen;

    public function __construct()
    {
        $this->dokumen = new ArrayCollection();
    }

    public function getRegister(): ?string
    {
        return $this->register;
    }

    public function setRegister(?string $register): self
    {
        $this->register = $register;

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

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(?\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getId(): ?string
    {
        return $this->id;
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

    public function getUpdatedBy(): ?User
    {
        return $this->updatedBy;
    }

    public function setUpdatedBy(?User $updatedBy): self
    {
        $this->updatedBy = $updatedBy;

        return $this;
    }

    /**
     * @return Collection|Dokumen[]
     */
    public function getDokumen(): Collection
    {
        return $this->dokumen;
    }

    public function addDokuman(Dokumen $dokuman): self
    {
        if (!$this->dokumen->contains($dokuman)) {
            $this->dokumen[] = $dokuman;
        }

        return $this;
    }

    public function removeDokuman(Dokumen $dokuman): self
    {
        if ($this->dokumen->contains($dokuman)) {
            $this->dokumen->removeElement($dokuman);
        }

        return $this;
    }
}
