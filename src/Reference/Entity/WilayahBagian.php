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

class WilayahBagian
{
    private $wilayahBagianID;

    private $id;

    private $wilayahs;

    public function __construct()
    {
        $this->wilayahs = new ArrayCollection();
    }

    public function getWilayahBagianID(): ?string
    {
        return $this->wilayahBagianID;
    }

    public function setWilayahBagianID(?string $wilayahBagianID): self
    {
        $this->wilayahBagianID = $wilayahBagianID;

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