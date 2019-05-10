<?php


namespace Paroki\Core\Entity;


use Paroki\User\Entity\User;

trait LoggableTrait
{
    /**
     * Data di update pada waktu
     * @var null|\DateTime
     */
    protected $updatedAt;

    /**
     * Data di update oleh user
     * @var null|User
     */
    protected $updatedBy;

    /**
     * @return \DateTime|null
     */
    public function getUpdatedAt(): ?\DateTime
    {
        return $this->updatedAt;
    }

    /**
     * @param \DateTime|null $updatedAt
     * @return static
     */
    public function setUpdatedAt(?\DateTime $updatedAt = null)
    {
        $this->updatedAt = $updatedAt;
        return $this;
    }

    /**
     * @return User|null
     */
    public function getUpdatedBy(): ?User
    {
        return $this->updatedBy;
    }

    /**
     * @param User|null $updatedBy
     * @return static
     */
    public function setUpdatedBy(?User $updatedBy = null)
    {
        $this->updatedBy = $updatedBy;
        return $this;
    }
}
