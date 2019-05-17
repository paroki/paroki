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

namespace SIAP\Reference\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

class Wilayah
{
    private $id;

    private $nama;

    private $ketua;

    private $wilayah;

    private $kode;

    private $refDuk;

    private $lingkungans;

    private $jenisWilayah;

    public function __construct()
    {
        $this->lingkungans = new ArrayCollection();
    }

    public function getNamaWilayah(): ?string
    {
        return $this->namaWilayah;
    }

    public function setNamaWilayah(?string $namaWilayah): self
    {
        $this->namaWilayah = $namaWilayah;

        return $this;
    }

    public function getKetuaWilayah(): ?string
    {
        return $this->ketuaWilayah;
    }

    public function setKetuaWilayah(?string $ketuaWilayah): self
    {
        $this->ketuaWilayah = $ketuaWilayah;

        return $this;
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    /**
     * @return Collection|Lingkungan[]
     */
    public function getLingkungans(): Collection
    {
        return $this->lingkungans;
    }

    public function addLingkungan(Lingkungan $lingkungan): self
    {
        if (!$this->lingkungans->contains($lingkungan)) {
            $this->lingkungans[] = $lingkungan;
            $lingkungan->setWilayah($this);
        }

        return $this;
    }

    public function removeLingkungan(Lingkungan $lingkungan): self
    {
        if ($this->lingkungans->contains($lingkungan)) {
            $this->lingkungans->removeElement($lingkungan);
            // set the owning side to null (unless already changed)
            if ($lingkungan->getWilayah() === $this) {
                $lingkungan->setWilayah(null);
            }
        }

        return $this;
    }

    public function getWilayah(): ?JenisWilayah
    {
        return $this->wilayah;
    }

    public function setWilayah(?JenisWilayah $wilayah): self
    {
        $this->wilayah = $wilayah;

        return $this;
    }

    public function getKode(): ?string
    {
        return $this->kode;
    }

    public function setKode(?string $kode): self
    {
        $this->kode = $kode;

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

    public function getKetua(): ?string
    {
        return $this->ketua;
    }

    public function setKetua(?string $ketua): self
    {
        $this->ketua = $ketua;

        return $this;
    }

    public function getRefDuk(): ?int
    {
        return $this->refDuk;
    }

    public function setRefDuk(?int $refDuk): self
    {
        $this->refDuk = $refDuk;

        return $this;
    }
}
