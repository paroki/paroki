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
use SIAP\Core\Entity\LoggableInterface;
use SIAP\Core\Entity\LoggableTrait;
use SIAP\Core\Entity\MediaOwnerTrait;
use SIAP\Core\Entity\RequireParokiTrait;
use SIAP\Reference\Entity\RequireParokiInterface;

class BaptisKomuni implements LoggableInterface, RequireParokiInterface
{
    use LoggableTrait, RequireParokiTrait, MediaOwnerTrait;

    /**
     * @var string|null
     */
    private $tempat;

    /**
     * @var \DateTimeInterface|null
     */
    private $tanggal;

    /**
     * @var string|null
     */
    private $yangMemberi;

    /**
     * @var string|null
     */
    private $catatan;

    /**
     * @var string|null
     */
    private $id;

    /**
     * @var string|null
     */
    private $register;

    public function __construct()
    {
        $this->dokumen = new ArrayCollection();
    }

    public function getRegister(): ?string
    {
        return $this->register;
    }

    public function setRegister(?string $register): self
    {
        $this->register = $register;

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

    public function getYangMemberi(): ?string
    {
        return $this->yangMemberi;
    }

    public function setYangMemberi(?string $yangMemberi): self
    {
        $this->yangMemberi = $yangMemberi;

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
