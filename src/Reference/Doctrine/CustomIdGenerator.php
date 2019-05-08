<?php


namespace Paroki\Reference\Doctrine;


use Doctrine\ORM\EntityManager;
use Doctrine\ORM\Id\AbstractIdGenerator;
use Paroki\Reference\Entity\Lingkungan;

class CustomIdGenerator extends AbstractIdGenerator
{
    /**
     * @param EntityManager $em
     * @param object|null $entity
     * @return mixed|string
     * @throws \Exception When entity is not supported
     */
    public function generate(EntityManager $em, $entity)
    {
        if($entity instanceof Lingkungan){
            return $this->generateLingkunganId($entity);
        }

        throw new \Exception('Unsupported class '.$entity);
    }

    public static function generateLingkunganId(Lingkungan $entity)
    {
        $exp = [
            $entity->getParoki()->getKode(),
            $entity->getKode()
        ];

        return implode('.',$exp);
    }
}
