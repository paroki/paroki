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

class Agama
{
    private $agama;

    private $id;

    public function getAgama(): ?string
    {
        return $this->agama;
    }

    public function setAgama(?string $agama): self
    {
        $this->agama = $agama;

        return $this;
    }

    public function getId(): ?string
    {
        return $this->id;
    }
}
