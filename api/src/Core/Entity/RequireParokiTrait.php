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

use SIAP\Reference\Entity\Paroki;

trait RequireParokiTrait
{
    /**
     * @var Paroki|null
     */
    protected $paroki;

    public function getParoki(): ?Paroki
    {
        return $this->paroki;
    }

    /**
     * @return static
     */
    public function setParoki(?Paroki $paroki)
    {
        $this->paroki = $paroki;

        return $this;
    }
}
