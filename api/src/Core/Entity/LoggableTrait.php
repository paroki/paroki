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

use SIAP\User\Entity\User;

trait LoggableTrait
{
    /**
     * Data di update pada waktu.
     *
     * @var \DateTime|null
     */
    protected $updatedAt;

    /**
     * Data di update oleh user.
     *
     * @var User|null
     */
    protected $updatedBy;

    public function getUpdatedAt(): ?\DateTime
    {
        return $this->updatedAt;
    }

    /**
     * @return static
     */
    public function setUpdatedAt(?\DateTime $updatedAt = null)
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getUpdatedBy(): ?User
    {
        return $this->updatedBy;
    }

    /**
     * @return static
     */
    public function setUpdatedBy(?User $updatedBy = null)
    {
        $this->updatedBy = $updatedBy;

        return $this;
    }
}
