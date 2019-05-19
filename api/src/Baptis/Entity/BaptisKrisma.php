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

use SIAP\Core\Entity\DokumenOwnerTrait;
use SIAP\Core\Entity\LoggableInterface;
use SIAP\Core\Entity\LoggableTrait;
use SIAP\Core\Entity\RequireParokiTrait;
use SIAP\Reference\Entity\RequireParokiInterface;

class BaptisKrisma implements LoggableInterface, RequireParokiInterface
{
    use LoggableTrait, RequireParokiTrait, DokumenOwnerTrait;

    /**
     * @var string|null Nama Krisma
     */
    private $nama;

    /**
     * @var string|null Tempat Krisma
     */
    private $tempat;

    /**
     * @var \DateTimeInterface|null Tanggal Krisma
     */
    private $tanggal;

    /**
     * @var string|null Yang memberi krisma
     */
    private $pemberi;

    /**
     * @var string|null
     */
    private $catatan;

    /**
     * @var string|null
     */
    private $id;

    /**
     * @var string
     */
    private $register;

    public function getRegister(): ?string
    {
        return $this->register;
    }

    public function setRegister(?string $register): self
    {
        $this->register = $register;

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

    public function getTempat(): ?string
    {
        return $this->tempat;
    }

    public function setTempat(?string $tempat): self
    {
        $this->tempat = $tempat;

        return $this;
    }

    public function getTanggal(): ?\DateTimeInterface
    {
        return $this->tanggal;
    }

    public function setTanggal(?\DateTimeInterface $tanggal): self
    {
        $this->tanggal = $tanggal;

        return $this;
    }

    public function getPemberi(): ?string
    {
        return $this->pemberi;
    }

    public function setPemberi(?string $pemberi): self
    {
        $this->pemberi = $pemberi;

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
