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

namespace Paroki\Baptis\Entity;

use Paroki\Reference\Entity\Paroki;

class BaptisKomuni
{
    private $tempatKomuni;

    private $tanggalKomuni;

    private $yangMemberiKomuni;

    private $catatan;

    private $id;

    private $baptis;

    private $paroki;

    public function getTempatKomuni(): ?string
    {
        return $this->tempatKomuni;
    }

    public function setTempatKomuni(?string $tempatKomuni): self
    {
        $this->tempatKomuni = $tempatKomuni;

        return $this;
    }

    public function getTanggalKomuni(): ?\DateTimeInterface
    {
        return $this->tanggalKomuni;
    }

    public function setTanggalKomuni(?\DateTimeInterface $tanggalKomuni): self
    {
        $this->tanggalKomuni = $tanggalKomuni;

        return $this;
    }

    public function getYangMemberiKomuni(): ?string
    {
        return $this->yangMemberiKomuni;
    }

    public function setYangMemberiKomuni(?string $yangMemberiKomuni): self
    {
        $this->yangMemberiKomuni = $yangMemberiKomuni;

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

    public function getBaptis(): ?Baptis
    {
        return $this->baptis;
    }

    public function setBaptis(?Baptis $baptis): self
    {
        $this->baptis = $baptis;

        // set (or unset) the owning side of the relation if necessary
        $newKomuni = null === $baptis ? null : $this;
        if ($newKomuni !== $baptis->getKomuni()) {
            $baptis->setKomuni($newKomuni);
        }

        return $this;
    }

    public function getParoki(): ?Paroki
    {
        return $this->paroki;
    }

    public function setParoki(?Paroki $paroki): self
    {
        $this->paroki = $paroki;

        return $this;
    }
}
