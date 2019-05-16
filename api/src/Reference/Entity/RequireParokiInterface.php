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

interface RequireParokiInterface
{
    /**
     * @param Paroki $paroki
     *
     * @return static
     */
    public function setParoki(Paroki $paroki);

    /**
     * @return Paroki
     */
    public function getParoki();
}
