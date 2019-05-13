<?php


namespace SIAP\Reference\Entity;


interface RequireParokiInterface
{
    /**
     * @param Paroki $paroki
     * @return static
     */
    public function setParoki(Paroki $paroki = null);
}
