<?php

namespace Paroki\Reference\Entity;

class Agama
{
    private $agama;

    private $id;

    public function getAgama(): ?string
    {
        return $this->agama;
    }

    public function setAgama(?string $agama): self
    {
        $this->agama = $agama;

        return $this;
    }

    public function getId(): ?string
    {
        return $this->id;
    }
}
