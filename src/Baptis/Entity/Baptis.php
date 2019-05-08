<?php

namespace Paroki\Baptis\Entity;

use Paroki\Core\Entity\AbstractBiodata;
use Paroki\Reference\Entity\Agama;
use Paroki\Reference\Entity\Lingkungan;
use Paroki\Reference\Entity\Paroki;
use Paroki\User\Entity\User;

class Baptis extends AbstractBiodata
{
    /**
     * @var string
     */
    private $kodeBaptis;

    /**
     * @var string
     */
    private $buku;

    /**
     * @var integer
     */
    private $halaman = 0;

    /**
     * @var string
     */
    private $nomor;

    /**
     * @var int
     */
    private $lanjutan;

    /**
     * @var null|string
     */
    private $namaBaptis;

    /**
     * @var string
     */
    private $tempatBaptis;

    /**
     * @var \DateTime
     */
    private $tanggalBaptis;

    /**
     * @var string
     */
    private $waliBaptis1;

    /**
     * @var string
     */
    private $waliBaptis2;

    /**
     * @var string
     */
    private $catatan;

    /**
     * @var \DateTime
     */
    private $updatedAt;

    /**
     * @var string
     */
    private $id;

    /**
     * @var null|BaptisKomuni
     */
    private $komuni;

    /**
     * @var null|BaptisKrisma
     */
    private $krisma;

    /**
     * @var null|BaptisPerkawinan
     */
    private $perkawinan;

    /**
     * @var null|Diterima
     */
    private $diterima;

    /**
     * @var null|User
     */
    private $updatedBy;

    /**
     * @var null|Paroki
     */
    private $paroki;

    /**
     * @var null|Lingkungan
     */
    private $lingkungan;

    /**
     * @var null|Agama
     */
    private $agamaSebelumBaptis;

    public function getBaptisId(): ?string
    {
        return $this->kodeBaptis;
    }

    public function setBaptisId(string $kodeBaptis): self
    {
        $this->kodeBaptis = $kodeBaptis;

        return $this;
    }

    public function getBuku(): ?string
    {
        return $this->buku;
    }

    public function setBuku(string $buku): self
    {
        $this->buku = $buku;

        return $this;
    }

    public function getHalaman(): ?int
    {
        return $this->halaman;
    }

    public function setHalaman(int $halaman): self
    {
        $this->halaman = $halaman;

        return $this;
    }

    public function getNomor(): ?int
    {
        return $this->nomor;
    }

    public function setNomor(int $nomor): self
    {
        $this->nomor = $nomor;

        return $this;
    }

    public function getTempatBaptis(): ?string
    {
        return $this->tempatBaptis;
    }

    public function setTempatBaptis(?string $tempatBaptis): self
    {
        $this->tempatBaptis = $tempatBaptis;

        return $this;
    }

    public function getTanggalBaptis(): ?\DateTimeInterface
    {
        return $this->tanggalBaptis;
    }

    public function setTanggalBaptis(?\DateTimeInterface $tanggalBaptis): self
    {
        $this->tanggalBaptis = $tanggalBaptis;

        return $this;
    }

    public function getWaliBaptis1(): ?string
    {
        return $this->waliBaptis1;
    }

    public function setWaliBaptis1(?string $waliBaptis1): self
    {
        $this->waliBaptis1 = $waliBaptis1;

        return $this;
    }

    public function getWaliBaptis2(): ?string
    {
        return $this->waliBaptis2;
    }

    public function setWaliBaptis2(?string $waliBaptis2): self
    {
        $this->waliBaptis2 = $waliBaptis2;

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

    public function getUpdatedAt(): ?\DateTimeInterface
    {
        return $this->updatedAt;
    }

    public function setUpdatedAt(\DateTimeInterface $updatedAt): self
    {
        $this->updatedAt = $updatedAt;

        return $this;
    }

    public function getId(): ?string
    {
        return $this->id;
    }

    public function getKomuni(): ?BaptisKomuni
    {
        return $this->komuni;
    }

    public function setKomuni(?BaptisKomuni $komuni): self
    {
        $this->komuni = $komuni;

        return $this;
    }

    public function getKrisma(): ?BaptisKrisma
    {
        return $this->krisma;
    }

    public function setKrisma(?BaptisKrisma $krisma): self
    {
        $this->krisma = $krisma;

        return $this;
    }

    public function getPerkawinan(): ?BaptisPerkawinan
    {
        return $this->perkawinan;
    }

    public function setPerkawinan(?BaptisPerkawinan $perkawinan): self
    {
        $this->perkawinan = $perkawinan;

        return $this;
    }

    public function getDiterima(): ?Diterima
    {
        return $this->diterima;
    }

    public function setDiterima(?Diterima $diterima): self
    {
        $this->diterima = $diterima;

        return $this;
    }

    public function getUpdatedBy(): ?User
    {
        return $this->updatedBy;
    }

    public function setUpdatedBy(?User $updatedBy): self
    {
        $this->updatedBy = $updatedBy;

        return $this;
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

    public function getLingkungan(): ?Lingkungan
    {
        return $this->lingkungan;
    }

    public function setLingkungan(?Lingkungan $lingkungan): self
    {
        $this->lingkungan = $lingkungan;

        return $this;
    }

    public function getAgamaSebelumBaptis(): ?Agama
    {
        return $this->agamaSebelumBaptis;
    }

    public function setAgamaSebelumBaptis(?Agama $agamaSebelumBaptis): self
    {
        $this->agamaSebelumBaptis = $agamaSebelumBaptis;

        return $this;
    }

    public function getLanjutan(): ?string
    {
        return $this->lanjutan;
    }

    public function setLanjutan(?string $lanjutan): self
    {
        $this->lanjutan = $lanjutan;

        return $this;
    }

    public function getKodeBaptis(): ?string
    {
        return $this->kodeBaptis;
    }

    public function setKodeBaptis(string $kodeBaptis): self
    {
        $this->kodeBaptis = $kodeBaptis;

        return $this;
    }

    public function getNamaBaptis(): ?string
    {
        return $this->namaBaptis;
    }

    public function setNamaBaptis(?string $namaBaptis): self
    {
        $this->namaBaptis = $namaBaptis;

        return $this;
    }
}
