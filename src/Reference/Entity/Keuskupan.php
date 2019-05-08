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

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

class Keuskupan
{
    private $NoUrutKeuskupan;

    private $NamaKeuskupan;

    private $NamaKeuskupanLatin;

    private $AlamatKeuskupan;

    private $KotaKeuskupan;

    private $TeleponKeuskupan;

    private $FaxKeuskupan;

    private $WebsiteKeuskupan;

    private $EmailKeuskupan;

    private $NamaUskupSaatIni;

    private $KeuskupanID;

    private $parokis;

    public function __construct()
    {
        $this->parokis = new ArrayCollection();
    }

    public function getNoUrutKeuskupan(): ?int
    {
        return $this->NoUrutKeuskupan;
    }

    public function setNoUrutKeuskupan(?int $NoUrutKeuskupan): self
    {
        $this->NoUrutKeuskupan = $NoUrutKeuskupan;

        return $this;
    }

    public function getNamaKeuskupan(): ?string
    {
        return $this->NamaKeuskupan;
    }

    public function setNamaKeuskupan(?string $NamaKeuskupan): self
    {
        $this->NamaKeuskupan = $NamaKeuskupan;

        return $this;
    }

    public function getNamaKeuskupanLatin(): ?string
    {
        return $this->NamaKeuskupanLatin;
    }

    public function setNamaKeuskupanLatin(?string $NamaKeuskupanLatin): self
    {
        $this->NamaKeuskupanLatin = $NamaKeuskupanLatin;

        return $this;
    }

    public function getAlamatKeuskupan(): ?string
    {
        return $this->AlamatKeuskupan;
    }

    public function setAlamatKeuskupan(?string $AlamatKeuskupan): self
    {
        $this->AlamatKeuskupan = $AlamatKeuskupan;

        return $this;
    }

    public function getKotaKeuskupan(): ?string
    {
        return $this->KotaKeuskupan;
    }

    public function setKotaKeuskupan(?string $KotaKeuskupan): self
    {
        $this->KotaKeuskupan = $KotaKeuskupan;

        return $this;
    }

    public function getTeleponKeuskupan(): ?string
    {
        return $this->TeleponKeuskupan;
    }

    public function setTeleponKeuskupan(?string $TeleponKeuskupan): self
    {
        $this->TeleponKeuskupan = $TeleponKeuskupan;

        return $this;
    }

    public function getFaxKeuskupan(): ?string
    {
        return $this->FaxKeuskupan;
    }

    public function setFaxKeuskupan(?string $FaxKeuskupan): self
    {
        $this->FaxKeuskupan = $FaxKeuskupan;

        return $this;
    }

    public function getWebsiteKeuskupan(): ?string
    {
        return $this->WebsiteKeuskupan;
    }

    public function setWebsiteKeuskupan(?string $WebsiteKeuskupan): self
    {
        $this->WebsiteKeuskupan = $WebsiteKeuskupan;

        return $this;
    }

    public function getEmailKeuskupan(): ?string
    {
        return $this->EmailKeuskupan;
    }

    public function setEmailKeuskupan(?string $EmailKeuskupan): self
    {
        $this->EmailKeuskupan = $EmailKeuskupan;

        return $this;
    }

    public function getNamaUskupSaatIni(): ?string
    {
        return $this->NamaUskupSaatIni;
    }

    public function setNamaUskupSaatIni(?string $NamaUskupSaatIni): self
    {
        $this->NamaUskupSaatIni = $NamaUskupSaatIni;

        return $this;
    }

    public function getKeuskupanID(): ?string
    {
        return $this->KeuskupanID;
    }

    /**
     * @return Collection|Paroki[]
     */
    public function getParokis(): Collection
    {
        return $this->parokis;
    }

    public function addParoki(Paroki $paroki): self
    {
        if (!$this->parokis->contains($paroki)) {
            $this->parokis[] = $paroki;
            $paroki->setKeuskupan($this);
        }

        return $this;
    }

    public function removeParoki(Paroki $paroki): self
    {
        if ($this->parokis->contains($paroki)) {
            $this->parokis->removeElement($paroki);
            // set the owning side to null (unless already changed)
            if ($paroki->getKeuskupan() === $this) {
                $paroki->setKeuskupan(null);
            }
        }

        return $this;
    }
}
