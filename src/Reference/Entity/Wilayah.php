<?php

namespace Paroki\Reference\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

class Wilayah
{
    private $namaWilayah;

    private $ketuaWilayah;

    private $id;

    private $lingkungans;

    private $wilayah;

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

    public function getId(): ?int
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
