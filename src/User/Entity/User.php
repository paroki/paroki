<?php

namespace Paroki\User\Entity;

use Paroki\Reference\Entity\Paroki;
use FOS\UserBundle\Model\User as BaseUser;

class User extends BaseUser
{
    /**
     * @var string Nama lengkap pengguna
     */
    private $nama;

    /**
     * @var Paroki paroki pengguna
     */
    private $paroki;

    /**
     * @var string
     */
    protected $id;

    public function __construct()
    {
        parent::__construct();
        $this->setEnabled(true);
    }

    public function getNama(): ?string
    {
        return $this->nama;
    }

    public function setNama(string $nama): self
    {
        $this->nama = $nama;

        return $this;
    }

    public function getId(): ?string
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
}
