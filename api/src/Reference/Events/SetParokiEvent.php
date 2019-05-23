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

namespace SIAP\Reference\Events;

use SIAP\Reference\Entity\RequireParokiInterface;
use Symfony\Component\EventDispatcher\Event;

class SetParokiEvent extends Event
{
    /**
     * @var RequireParokiInterface
     */
    private $entity;

    public function __construct(
        RequireParokiInterface $entity
    ) {
        $this->entity = $entity;
    }

    /**
     * @return RequireParokiInterface
     */
    public function getEntity()
    {
        return $this->entity;
    }
}
