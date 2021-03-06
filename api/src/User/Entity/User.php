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

namespace SIAP\User\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use SIAP\Core\Entity\MediaObject;
use SIAP\Reference\Entity\Paroki;
use SIAP\Reference\Entity\RequireParokiInterface;
use Symfony\Component\HttpFoundation\File\File;
use Vich\UploaderBundle\Mapping\Annotation as Vich;

/**
 * Class User.
 *
 * @Vich\Uploadable
 */
class User extends BaseUser implements RequireParokiInterface
{
    /**
     * @var string Nama lengkap pengguna
     */
    private $nama;

    /**
     * @Vich\UploadableField(
     *     mapping="user_foto",
     *     fileNameProperty="foto.filePath",
     *     size="foto.size",
     *     mimeType="foto.mimeType",
     *     originalName="foto.originalName",
     *     dimensions="foto.dimensions"
     * )
     */
    private $fotoFile;

    /**
     * @var MediaObject
     */
    private $foto;

    /**
     * @var Paroki paroki pengguna
     */
    private $paroki;

    /**
     * @var string|null
     */
    private $currentPassword;

    /**
     * @var string
     */
    protected $id;

    /**
     * @var \DateTimeImmutable
     */
    private $updatedAt;

    public function __construct()
    {
        parent::__construct();
        $this->setEnabled(true);
        $this->addRole('ROLE_USER');
        $this->foto = new MediaObject();
    }

    public function getCurrentPassword(): ?string
    {
        return $this->currentPassword;
    }

    public function setCurrentPassword(?string $currentPassword): self
    {
        $this->currentPassword = $currentPassword;

        return $this;
    }

    /**
     * @return mixed
     */
    public function getFotoFile(): ?File
    {
        return $this->fotoFile;
    }

    /**
     * @param mixed $fotoFile
     *
     * @throws \Exception
     *
     * @return User
     */
    public function setFotoFile(?File $fotoFile = null)
    {
        $this->fotoFile = $fotoFile;
        if (null !== $fotoFile) {
            $this->setUpdatedAt(new \DateTimeImmutable());
        }

        return $this;
    }

    public function getUpdatedAt(): \DateTimeImmutable
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(\DateTimeImmutable $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

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

    public function getId()
    {
        return $this->id;
    }

    public function getParoki(): ?Paroki
    {
        return $this->paroki;
    }

    public function setParoki(?Paroki $paroki): self
    {
        $this->paroki = $paroki;

        return $this;
    }

    /**
     * @return MediaObject
     */
    public function getFoto(): ?MediaObject
    {
        return $this->foto;
    }

    public function setFoto(MediaObject $foto): self
    {
        $this->foto = $foto;

        return $this;
    }
}
