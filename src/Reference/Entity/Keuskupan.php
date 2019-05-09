<?php

namespace Paroki\Reference\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

class Keuskupan
{
    private $noUrutKeuskupan;

    private $namaKeuskupan;

    private $namaKeuskupanLatin;

    private $alamatKeuskupan;

    private $kotaKeuskupan;

    private $teleponKeuskupan;

    private $faxKeuskupan;

    private $websiteKeuskupan;

    private $emailKeuskupan;

    private $namaUskupSaatIni;

    private $kode;

    /**
     * GUID for keuskupan
     * @var string
     */
    private $guid;

    public function __construct()
    {
    }

    public function setKode(string $kode): self
    {
        $this->kode = $kode;

        return $this;
    }

    public function getNoUrutKeuskupan(): ?int
    {
        return $this->noUrutKeuskupan;
    }

    public function setNoUrutKeuskupan(?int $noUrutKeuskupan): self
    {
        $this->noUrutKeuskupan = $noUrutKeuskupan;

        return $this;
    }

    public function getNamaKeuskupan(): ?string
    {
        return $this->namaKeuskupan;
    }

    public function setNamaKeuskupan(?string $namaKeuskupan): self
    {
        $this->namaKeuskupan = $namaKeuskupan;

        return $this;
    }

    public function getNamaKeuskupanLatin(): ?string
    {
        return $this->namaKeuskupanLatin;
    }

    public function setNamaKeuskupanLatin(?string $namaKeuskupanLatin): self
    {
        $this->namaKeuskupanLatin = $namaKeuskupanLatin;

        return $this;
    }

    public function getAlamatKeuskupan(): ?string
    {
        return $this->alamatKeuskupan;
    }

    public function setAlamatKeuskupan(?string $alamatKeuskupan): self
    {
        $this->alamatKeuskupan = $alamatKeuskupan;

        return $this;
    }

    public function getKotaKeuskupan(): ?string
    {
        return $this->kotaKeuskupan;
    }

    public function setKotaKeuskupan(?string $kotaKeuskupan): self
    {
        $this->kotaKeuskupan = $kotaKeuskupan;

        return $this;
    }

    public function getTeleponKeuskupan(): ?string
    {
        return $this->teleponKeuskupan;
    }

    public function setTeleponKeuskupan(?string $teleponKeuskupan): self
    {
        $this->teleponKeuskupan = $teleponKeuskupan;

        return $this;
    }

    public function getFaxKeuskupan(): ?string
    {
        return $this->faxKeuskupan;
    }

    public function setFaxKeuskupan(?string $faxKeuskupan): self
    {
        $this->faxKeuskupan = $faxKeuskupan;

        return $this;
    }

    public function getWebsiteKeuskupan(): ?string
    {
        return $this->websiteKeuskupan;
    }

    public function setWebsiteKeuskupan(?string $websiteKeuskupan): self
    {
        $this->websiteKeuskupan = $websiteKeuskupan;

        return $this;
    }

    public function getEmailKeuskupan(): ?string
    {
        return $this->emailKeuskupan;
    }

    public function setEmailKeuskupan(?string $emailKeuskupan): self
    {
        $this->emailKeuskupan = $emailKeuskupan;

        return $this;
    }

    public function getNamaUskupSaatIni(): ?string
    {
        return $this->namaUskupSaatIni;
    }

    public function setNamaUskupSaatIni(?string $namaUskupSaatIni): self
    {
        $this->namaUskupSaatIni = $namaUskupSaatIni;

        return $this;
    }

    public function getKode(): ?string
    {
        return $this->kode;
    }

    public function getGuid(): ?string
    {
        return $this->guid;
    }

    public function setGuid(string $guid): self
    {
        $this->guid = $guid;

        return $this;
    }
}
