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

namespace SIAP\Baptis\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use SIAP\Core\Entity\Dokumen;
use SIAP\Reference\Entity\Paroki;
use SIAP\User\Entity\User;

class BaptisKomuni
{
    private $tempat;

    private $tanggal;

    private $yangMemberi;

    private $catatan;

    private $id;

    private $paroki;

    private $register;

    private $updatedAt;

    private $updatedBy;

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

    public function getTempat(): ?string
    {
        return $this->tempat;
    }

    public function setTempat(?string $tempat): self
    {
        $this->tempat = $tempat;

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

    public function getYangMemberi(): ?string
    {
        return $this->yangMemberi;
    }

    public function setYangMemberi(?string $yangMemberi): self
    {
        $this->yangMemberi = $yangMemberi;

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
