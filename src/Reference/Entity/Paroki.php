<?php

namespace Paroki\Reference\Entity;

use ApiPlatform\Core\Annotation\ApiProperty;

/**
 * Class Paroki
 * @package Paroki\Reference\Entity
 */
class Paroki
{
    private $noParoki;

    private $namaParoki;

    private $namaGereja;

    private $alamatParoki;

    private $kotaParoki;

    private $teleponParoki;

    private $faxParoki;

    private $websiteParoki;

    private $emailParoki;

    private $pastorParoki;

    private $wilayahKeuskupan;

    /**
     * GUID for paroki
     * @var string
     */
    private $guid;

    /**
     * @var string
     */
    private $kode;

    private $keuskupan;

    private $id;

    public function setKode(string $kode): self
    {
        $this->kode = $kode;

        return $this;
    }

    public function getNoParoki(): ?int
    {
        return $this->noParoki;
    }

    public function setNoParoki(?int $noParoki): self
    {
        $this->noParoki = $noParoki;

        return $this;
    }

    public function getNamaParoki(): ?string
    {
        return $this->namaParoki;
    }

    public function setNamaParoki(?string $namaParoki): self
    {
        $this->namaParoki = $namaParoki;

        return $this;
    }

    public function getNamaGereja(): ?string
    {
        return $this->namaGereja;
    }

    public function setNamaGereja(?string $namaGereja): self
    {
        $this->namaGereja = $namaGereja;

        return $this;
    }

    public function getAlamatParoki(): ?string
    {
        return $this->alamatParoki;
    }

    public function setAlamatParoki(?string $alamatParoki): self
    {
        $this->alamatParoki = $alamatParoki;

        return $this;
    }

    public function getKotaParoki(): ?string
    {
        return $this->kotaParoki;
    }

    public function setKotaParoki(?string $kotaParoki): self
    {
        $this->kotaParoki = $kotaParoki;

        return $this;
    }

    public function getTeleponParoki(): ?string
    {
        return $this->teleponParoki;
    }

    public function setTeleponParoki(?string $teleponParoki): self
    {
        $this->teleponParoki = $teleponParoki;

        return $this;
    }

    public function getFaxParoki(): ?string
    {
        return $this->faxParoki;
    }

    public function setFaxParoki(?string $faxParoki): self
    {
        $this->faxParoki = $faxParoki;

        return $this;
    }

    public function getWebsiteParoki(): ?string
    {
        return $this->websiteParoki;
    }

    public function setWebsiteParoki(?string $websiteParoki): self
    {
        $this->websiteParoki = $websiteParoki;

        return $this;
    }

    public function getEmailParoki(): ?string
    {
        return $this->emailParoki;
    }

    public function setEmailParoki(?string $emailParoki): self
    {
        $this->emailParoki = $emailParoki;

        return $this;
    }

    public function getPastorParoki(): ?string
    {
        return $this->pastorParoki;
    }

    public function setPastorParoki(?string $pastorParoki): self
    {
        $this->pastorParoki = $pastorParoki;

        return $this;
    }

    public function getWilayahKeuskupan(): ?string
    {
        return $this->wilayahKeuskupan;
    }

    public function setWilayahKeuskupan(?string $wilayahKeuskupan): self
    {
        $this->wilayahKeuskupan = $wilayahKeuskupan;

        return $this;
    }

    public function getKode(): ?string
    {
        return $this->kode;
    }

    public function getKeuskupan(): ?Keuskupan
    {
        return $this->keuskupan;
    }

    public function setKeuskupan(?Keuskupan $keuskupan): self
    {
        $this->keuskupan = $keuskupan;

        return $this;
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

    public function getId(): ?string
    {
        return $this->id;
    }
}
