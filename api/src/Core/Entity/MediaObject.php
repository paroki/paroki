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
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

/**
 * Class MediaObject
 * @Vich\Uploadable()
 * @package SIAP\Core\Entity
 */
class MediaObject
{
    /**
     * @var null|string
     */
    private $id;

    /**
     * @var null|string
     */
    private $nama;

    /**
     *
     * @var null|string
     */
    private $filePath;

    /**
     * @var null|string
     */
    private $urlPrefix;

    /**
     * @var null|string
     */
    private $catatan;

    /**
     * @var null|User
     */
    private $uploadedBy;

    /**
     * @var null|\DateTimeInterface
     */
    private $uploadedAt;

    /**
     * @var string
     */
    private $fileName;

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
        $this->dimensions = array();
    }

    public function getContentUrl()
    {
        if(is_null($this->getFilePath())){
            return null;
        }

        if(is_null($this->getUploadedAt())){
            $this->setUploadedAt(new \DateTimeImmutable());
        }
        
        return $this->urlPrefix. '/'.
            $this->getFilePath().
            '?t='.$this->getUploadedAt()->format('Y-m-d-H-i-s');
    }
    /**
     * @return string|null
     */
    public function getUrlPrefix(): ?string
    {
        return $this->urlPrefix;
    }

    /**
     * @param string|null $urlPrefix
     * @return MediaObject
     */
    public function setUrlPrefix(?string $urlPrefix): MediaObject
    {
        $this->urlPrefix = $urlPrefix;
        return $this;
    }

    /**
     * @return string|null
     */
    public function getId(): ?string
    {
        return $this->id;
    }

    /**
     * @return string|null
     */
    public function getOriginalName(): ?string
    {
        return $this->originalName;
    }

    /**
     * @param string|null $originalName
     * @return MediaObject
     */
    public function setOriginalName(?string $originalName): MediaObject
    {
        $this->originalName = $originalName;
        return $this;
    }

    /**
     * @return string|null
     */
    public function getMimeType(): ?string
    {
        return $this->mimeType;
    }

    /**
     * @param string|null $mimeType
     * @return MediaObject
     */
    public function setMimeType(?string $mimeType): MediaObject
    {
        $this->mimeType = $mimeType;
        return $this;
    }

    /**
     * @return int|null
     */
    public function getSize(): ?int
    {
        return $this->size;
    }

    /**
     * @param int|null $size
     * @return MediaObject
     */
    public function setSize(?int $size): MediaObject
    {
        $this->size = $size;
        return $this;
    }

    /**
     * @return array
     */
    public function getDimensions(): ?array
    {
        if(is_null($this->dimensions)){
            $this->dimensions = [];
        }
        return $this->dimensions;
    }

    /**
     * @param array $dimensions
     * @return MediaObject
     */
    public function setDimensions(?array $dimensions): MediaObject
    {
        $this->dimensions = $dimensions;
        return $this;
    }

    /**
     * @return null|string
     */
    public function getFileName(): ?string
    {
        return $this->fileName;
    }

    /**
     * @param string $fileName
     * @return MediaObject
     */
    public function setFileName(string $fileName): MediaObject
    {
        $this->fileName = $fileName;
        return $this;
    }

    /**
     * @return string|null
     */
    public function getNama(): ?string
    {
        return $this->nama;
    }

    /**
     * @param string|null $nama
     * @return MediaObject
     */
    public function setNama(?string $nama): MediaObject
    {
        $this->nama = $nama;
        return $this;
    }


    /**
     * @return string|null
     */
    public function getFilePath(): ?string
    {
        return $this->filePath;
    }

    /**
     * @param string|null $filePath
     * @return MediaObject
     */
    public function setFilePath(?string $filePath): MediaObject
    {
        $this->filePath = $filePath;
        return $this;
    }

    /**
     * @return string|null
     */
    public function getCatatan(): ?string
    {
        return $this->catatan;
    }

    /**
     * @param string|null $catatan
     * @return MediaObject
     */
    public function setCatatan(?string $catatan): MediaObject
    {
        $this->catatan = $catatan;
        return $this;
    }

    /**
     * @return User|null
     */
    public function getUploadedBy(): ?User
    {
        return $this->uploadedBy;
    }

    /**
     * @param User|null $uploadedBy
     * @return MediaObject
     */
    public function setUploadedBy(?User $uploadedBy): MediaObject
    {
        $this->uploadedBy = $uploadedBy;
        return $this;
    }

    /**
     * @return \DateTimeInterface|null
     */
    public function getUploadedAt(): ?\DateTimeInterface
    {
        return $this->uploadedAt;
    }

    /**
     * @param \DateTimeInterface|null $uploadedAt
     * @return MediaObject
     */
    public function setUploadedAt(?\DateTimeInterface $uploadedAt): MediaObject
    {
        $this->uploadedAt = $uploadedAt;
        return $this;
    }
}
