<?php

namespace Paroki\Core\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Doctrine\Common\Collections\Collection;
use Paroki\Baptis\Entity\Baptis;
use Paroki\User\Entity\User;

class Dokumen
{
    private $nama;

    private $uploadedAt;

    private $fileLocation;

    private $id;

    private $uploadedBy;

    public function getNama(): ?string
    {
        return $this->nama;
    }

    public function setNama(string $nama): self
    {
        $this->nama = $nama;

        return $this;
    }

    public function getUploadedAt(): ?\DateTimeInterface
    {
        return $this->uploadedAt;
    }

    public function setUploadedAt(?\DateTimeInterface $uploadedAt): self
    {
        $this->uploadedAt = $uploadedAt;

        return $this;
    }

    public function getFileLocation(): ?string
    {
        return $this->fileLocation;
    }

    public function setFileLocation(?string $fileLocation): self
    {
        $this->fileLocation = $fileLocation;

        return $this;
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    public function getUploadedBy(): ?User
    {
        return $this->uploadedBy;
    }

    public function setUploadedBy(?User $uploadedBy): self
    {
        $this->uploadedBy = $uploadedBy;

        return $this;
    }
    
}
