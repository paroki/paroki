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

class JenisWilayah
{
    private $jenis;

    private $id;

    private $wilayahs;

    public function __construct()
    {
        $this->wilayahs = new ArrayCollection();
    }

    public function getJenis(): ?string
    {
        return $this->jenis;
    }

    public function setJenis(?string $jenis): self
    {
        $this->jenis = $jenis;

        return $this;
    }

    public function getId(): ?int
    {
        return $this->id;
    }

    /**
     * @return Collection|Wilayah[]
     */
    public function getWilayahs(): Collection
    {
        return $this->wilayahs;
    }

    public function addWilayah(Wilayah $wilayah): self
    {
        if (!$this->wilayahs->contains($wilayah)) {
            $this->wilayahs[] = $wilayah;
            $wilayah->setWilayah($this);
        }

        return $this;
    }

    public function removeWilayah(Wilayah $wilayah): self
    {
        if ($this->wilayahs->contains($wilayah)) {
            $this->wilayahs->removeElement($wilayah);
            // set the owning side to null (unless already changed)
            if ($wilayah->getWilayah() === $this) {
                $wilayah->setWilayah(null);
            }
        }

        return $this;
    }
}
