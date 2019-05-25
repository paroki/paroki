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
use Vich\UploaderBundle\Mapping\Annotation as Vich;

/**
 * Class MediaObject.
 *
 * @Vich\Uploadable
 */
class MediaObject
{
    /**
     * @var string|null
     */
    private $id;

    /**
     * @var string|null
     */
    private $nama;

    /**
     * @var string|null
     */
    private $filePath;

    /**
     * @var string|null
     */
    private $urlPrefix;

    /**
     * @var string|null
     */
    private $catatan;

    /**
     * @var User|null
     */
    private $uploadedBy;

    /**
     * @var \DateTimeInterface|null
     */
    private $uploadedAt;

    /**
     * @var string|null
     */
    protected $originalName;

    /**
     * @var string|null
     */
    protected $mimeType;

    /**
     * @var int|null
     */
    protected $size;

    /**
     * @var array|null
     */
    protected $dimensions;

    public function __construct()
    {
        $this->dimensions = [];
    }

    public function getContentUrl()
    {
        if (null === $this->getFilePath()) {
            return null;
        }

        if (null === $this->getUploadedAt()) {
            $this->setUploadedAt(new \DateTimeImmutable());
        }

        return $this->urlPrefix.'/'.
            $this->getFilePath().
            '?t='.$this->getUploadedAt()->format('Y-m-d-H-i-s');
    }

    public function getUrlPrefix(): ?string
    {
        return $this->urlPrefix;
    }

    public function setUrlPrefix(?string $urlPrefix): self
    {
        $this->urlPrefix = $urlPrefix;

        return $this;
    }

    public function getId()
    {
        return $this->id;
    }

    public function getOriginalName(): ?string
    {
        return $this->originalName;
    }

    public function setOriginalName(?string $originalName): self
    {
        $this->originalName = $originalName;

        return $this;
    }

    public function getMimeType(): ?string
    {
        return $this->mimeType;
    }

    public function setMimeType(?string $mimeType): self
    {
        $this->mimeType = $mimeType;

        return $this;
    }

    public function getSize(): ?int
    {
        return $this->size;
    }

    public function setSize(?int $size): self
    {
        $this->size = $size;

        return $this;
    }

    /**
     * @return array
     */
    public function getDimensions(): ?array
    {
        return $this->dimensions;
    }

    /**
     * @param array|null $dimensions
     * @return MediaObject
     */
    public function setDimensions(?array $dimensions): self
    {
        $this->dimensions = $dimensions;

        return $this;
    }

    public function getNama(): ?string
    {
        return $this->nama;
    }

    public function setNama(?string $nama): self
    {
        $this->nama = $nama;

        return $this;
    }

    public function getFilePath(): ?string
    {
        return $this->filePath;
    }

    public function setFilePath(?string $filePath): self
    {
        $this->filePath = $filePath;

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

    public function getUploadedBy(): ?User
    {
        return $this->uploadedBy;
    }

    public function setUploadedBy(?User $uploadedBy): self
    {
        $this->uploadedBy = $uploadedBy;

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
}
