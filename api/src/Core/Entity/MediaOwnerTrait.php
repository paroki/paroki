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

trait MediaOwnerTrait
{
    /**
     * @var ArrayCollection|MediaObject[]
     */
    private $media;

    public function __construct()
    {
        $this->media = new ArrayCollection();
    }

    /**
     * @return Collection|MediaObject[]
     */
    public function getMedia(): Collection
    {
        return $this->media;
    }

    public function addMedia(MediaObject $media): self
    {
        if (!$this->media->contains($media)) {
            $this->media[] = $media;
        }

        return $this;
    }

    public function hasMedia($media)
    {
        return $this->media->contains($media) ? true : false;
    }

    public function removeMedia(MediaObject $media): self
    {
        if ($this->media->contains($media)) {
            $this->media->removeElement($media);
        }

        return $this;
    }
}
