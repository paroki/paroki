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

class Wilayah
{
    private $NamaWilayah;

    private $KetuaWilayah;

    private $ID;

    private $lingkungans;

    private $wilayah;

    public function __construct()
    {
        $this->lingkungans = new ArrayCollection();
    }

    public function getNamaWilayah(): ?string
    {
        return $this->NamaWilayah;
    }

    public function setNamaWilayah(?string $NamaWilayah): self
    {
        $this->NamaWilayah = $NamaWilayah;

        return $this;
    }

    public function getKetuaWilayah(): ?string
    {
        return $this->KetuaWilayah;
    }

    public function setKetuaWilayah(?string $KetuaWilayah): self
    {
        $this->KetuaWilayah = $KetuaWilayah;

        return $this;
    }

    public function getID(): ?int
    {
        return $this->ID;
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

    public function getWilayah(): ?WilayahBagian
    {
        return $this->wilayah;
    }

    public function setWilayah(?WilayahBagian $wilayah): self
    {
        $this->wilayah = $wilayah;

        return $this;
    }
}
