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
use SIAP\Core\Entity\LoggableInterface;
use SIAP\Core\Entity\LoggableTrait;

class BaptisPerkawinan implements LoggableInterface
{
    use LoggableTrait;

    private $register;

    private $tanggal;

    private $tempat;

    private $menikahDengan;

    private $saksiGereja;

    private $catatan;

    private $id;

    private $baptis;

    private $paroki;

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

    /**
     * @return Collection|Dokumen[]
     */
    public function getDokumen(): Collection
    {
        return $this->dokumen;
    }

    public function addDokumen(Dokumen $dokuman): self
    {
        if (!$this->dokumen->contains($dokuman)) {
            $this->dokumen[] = $dokuman;
        }

        return $this;
    }

    public function removeDokumen(Dokumen $dokuman): self
    {
        if ($this->dokumen->contains($dokuman)) {
            $this->dokumen->removeElement($dokuman);
        }

        return $this;
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
