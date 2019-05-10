<?php

namespace Paroki\Core\Entity;

use Paroki\User\Entity\User;

interface LoggableInterface
{
    /**
     * @param \DateTime|null $updatedAt
     * @return static
     */
    public function setUpdatedAt(\DateTime $updatedAt = null);

    public function getUpdatedAt(): ?\DateTime;

    /**
     * @param User|null $user
     * @return static
     */
    public function setUpdatedBy(User $user = null);

    public function getUpdatedBy(): ?User;
}
