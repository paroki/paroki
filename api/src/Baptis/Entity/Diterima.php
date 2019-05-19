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

namespace SIAP\Baptis\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use SIAP\Core\Entity\MediaOwnerTrait;
use SIAP\Core\Entity\LoggableInterface;
use SIAP\Core\Entity\LoggableTrait;
use SIAP\Core\Entity\RequireParokiTrait;
use SIAP\Reference\Entity\RequireParokiInterface;

class Diterima implements RequireParokiInterface, LoggableInterface
{
    use MediaOwnerTrait, RequireParokiTrait, LoggableTrait;

    private $tempatBaptis;

    private $tanggalBaptis;

    private $gerejaBaptis;

    private $yangMembaptis;

    private $nomorBukuBaptis;

    private $catatan;

    private $id;

    private $baptis;

    public function __construct()
    {
        $this->dokumen = new ArrayCollection();
    }

    public function getTempatBaptis(): ?string
    {
        return $this->tempatBaptis;
    }

    public function setTempatBaptis(?string $tempatBaptis): self
    {
        $this->tempatBaptis = $tempatBaptis;

        return $this;
    }

    public function getTanggalBaptis(): ?\DateTimeInterface
    {
        return $this->tanggalBaptis;
    }

    public function setTanggalBaptis(?\DateTimeInterface $tanggalBaptis): self
    {
        $this->tanggalBaptis = $tanggalBaptis;

        return $this;
    }

    public function getGerejaBaptis(): ?string
    {
        return $this->gerejaBaptis;
    }

    public function setGerejaBaptis(?string $gerejaBaptis): self
    {
        $this->gerejaBaptis = $gerejaBaptis;

        return $this;
    }

    public function getYangMembaptis(): ?string
    {
        return $this->yangMembaptis;
    }

    public function setYangMembaptis(?string $yangMembaptis): self
    {
        $this->yangMembaptis = $yangMembaptis;

        return $this;
    }

    public function getNomorBukuBaptis(): ?string
    {
        return $this->nomorBukuBaptis;
    }

    public function setNomorBukuBaptis(?string $nomorBukuBaptis): self
    {
        $this->nomorBukuBaptis = $nomorBukuBaptis;

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
}
