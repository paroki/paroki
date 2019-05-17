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
use SIAP\Reference\Entity\Paroki;
use SIAP\Reference\Entity\RequireParokiInterface;

class User extends BaseUser implements RequireParokiInterface
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
        $this->addRole('ROLE_USER');
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
