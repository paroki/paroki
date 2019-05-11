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

namespace SIAP\Reference\Doctrine;

use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Id\AbstractIdGenerator;
use SIAP\Reference\Entity\Lingkungan;

class CustomIdGenerator extends AbstractIdGenerator
{
    /**
     * @param object|null $entity
     *
     * @throws \Exception When entity is not supported
     *
     * @return mixed|string
     */
    public function generate(EntityManager $em, $entity)
    {
        if ($entity instanceof Lingkungan) {
            return $this->generateLingkunganId($entity);
        }

        throw new \Exception('Unsupported class '.$entity);
    }

    public static function generateLingkunganId(Lingkungan $entity)
    {
        $exp = [
            $entity->getParoki()->getKode(),
            $entity->getKode(),
        ];

        return implode('.', $exp);
    }
}
