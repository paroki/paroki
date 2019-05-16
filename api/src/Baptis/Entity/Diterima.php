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
use SIAP\User\Entity\User;

class Diterima
{
    private $tempatBaptis;

    private $tanggalBaptis;

    private $gerejaBaptis;

    private $yangMembaptis;

    private $nomorBukuBaptis;

    private $catatan;

    private $updatedAt;

    private $id;

    private $baptis;

    private $updatedBy;

    private $dokumen;

    public function __construct()
    {
        $this->dokumen = new ArrayCollection();
    }

    public function getTempatBaptis(): ?string
    {
        return $this->tempatBaptis;
    }

    public function setTempatBaptis(?string $tempatBaptis): self
    {
        $this->tempatBaptis = $tempatBaptis;

        return $this;
    }

    public function getTanggalBaptis(): ?string
    {
        return $this->tanggalBaptis;
    }

    public function setTanggalBaptis(?string $tanggalBaptis): self
    {
        $this->tanggalBaptis = $tanggalBaptis;

        return $this;
    }

    public function getGerejaBaptis(): ?string
    {
        return $this->gerejaBaptis;
    }

    public function setGerejaBaptis(?string $gerejaBaptis): self
    {
        $this->gerejaBaptis = $gerejaBaptis;

        return $this;
    }

    public function getYangMembaptis(): ?string
    {
        return $this->yangMembaptis;
    }

    public function setYangMembaptis(?string $yangMembaptis): self
    {
        $this->yangMembaptis = $yangMembaptis;

        return $this;
    }

    public function getNomorBukuBaptis(): ?string
    {
        return $this->nomorBukuBaptis;
    }

    public function setNomorBukuBaptis(?string $nomorBukuBaptis): self
    {
        $this->nomorBukuBaptis = $nomorBukuBaptis;

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

    public function getBaptis(): ?Baptis
    {
        return $this->baptis;
    }

    public function setBaptis(?Baptis $baptis): self
    {
        $this->baptis = $baptis;

        // set (or unset) the owning side of the relation if necessary
        $newDiterima = null === $baptis ? null : $this;
        if ($newDiterima !== $baptis->getDiterima()) {
            $baptis->setDiterima($newDiterima);
        }

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
