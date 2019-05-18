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

namespace SIAP\Core\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;

trait DokumenOwnerTrait
{
    /**
     * @var ArrayCollection|Dokumen[]
     */
    private $dokumen;

    public function __construct()
    {
        $this->dokumen = new ArrayCollection();
    }

    /**
     * @return Collection|Dokumen[]
     */
    public function getDokumen(): Collection
    {
        return $this->dokumen;
    }

    public function addDokumen(Dokumen $dokuman): self
    {
        if (!$this->dokumen->contains($dokuman)) {
            $this->dokumen[] = $dokuman;
        }

        return $this;
    }

    public function hasDokumen($dokumen)
    {
        return $this->dokumen->contains($dokumen) ? true : false;
    }

    public function removeDokumen(Dokumen $dokumen): self
    {
        if ($this->dokumen->contains($dokumen)) {
            $this->dokumen->removeElement($dokumen);
        }

        return $this;
    }
}
