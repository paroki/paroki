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

class Paroki
{
    private $NoParoki;

    private $NamaParoki;

    private $NamaGereja;

    private $AlamatParoki;

    private $KotaParoki;

    private $TeleponParoki;

    private $FaxParoki;

    private $WebsiteParoki;

    private $EmailParoki;

    private $PastorParoki;

    private $WilayahKeuskupan;

    private $ParokiID;

    private $keuskupan;

    public function getNoParoki(): ?int
    {
        return $this->NoParoki;
    }

    public function setNoParoki(?int $NoParoki): self
    {
        $this->NoParoki = $NoParoki;

        return $this;
    }

    public function getNamaParoki(): ?string
    {
        return $this->NamaParoki;
    }

    public function setNamaParoki(?string $NamaParoki): self
    {
        $this->NamaParoki = $NamaParoki;

        return $this;
    }

    public function getNamaGereja(): ?string
    {
        return $this->NamaGereja;
    }

    public function setNamaGereja(?string $NamaGereja): self
    {
        $this->NamaGereja = $NamaGereja;

        return $this;
    }

    public function getAlamatParoki(): ?string
    {
        return $this->AlamatParoki;
    }

    public function setAlamatParoki(?string $AlamatParoki): self
    {
        $this->AlamatParoki = $AlamatParoki;

        return $this;
    }

    public function getKotaParoki(): ?string
    {
        return $this->KotaParoki;
    }

    public function setKotaParoki(?string $KotaParoki): self
    {
        $this->KotaParoki = $KotaParoki;

        return $this;
    }

    public function getTeleponParoki(): ?string
    {
        return $this->TeleponParoki;
    }

    public function setTeleponParoki(?string $TeleponParoki): self
    {
        $this->TeleponParoki = $TeleponParoki;

        return $this;
    }

    public function getFaxParoki(): ?string
    {
        return $this->FaxParoki;
    }

    public function setFaxParoki(?string $FaxParoki): self
    {
        $this->FaxParoki = $FaxParoki;

        return $this;
    }

    public function getWebsiteParoki(): ?string
    {
        return $this->WebsiteParoki;
    }

    public function setWebsiteParoki(?string $WebsiteParoki): self
    {
        $this->WebsiteParoki = $WebsiteParoki;

        return $this;
    }

    public function getEmailParoki(): ?string
    {
        return $this->EmailParoki;
    }

    public function setEmailParoki(?string $EmailParoki): self
    {
        $this->EmailParoki = $EmailParoki;

        return $this;
    }

    public function getPastorParoki(): ?string
    {
        return $this->PastorParoki;
    }

    public function setPastorParoki(?string $PastorParoki): self
    {
        $this->PastorParoki = $PastorParoki;

        return $this;
    }

    public function getWilayahKeuskupan(): ?string
    {
        return $this->WilayahKeuskupan;
    }

    public function setWilayahKeuskupan(?string $WilayahKeuskupan): self
    {
        $this->WilayahKeuskupan = $WilayahKeuskupan;

        return $this;
    }

    public function getParokiID(): ?string
    {
        return $this->ParokiID;
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
}
