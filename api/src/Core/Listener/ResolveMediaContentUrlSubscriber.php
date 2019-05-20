<?php


namespace SIAP\Core\Listener;


use ApiPlatform\Core\EventListener\EventPriorities;
use ApiPlatform\Core\Util\RequestAttributesExtractor;
use SIAP\Core\Entity\MediaObject;
use Symfony\Component\EventDispatcher\EventSubscriberInterface;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\HttpKernel\Event\GetResponseForControllerResultEvent;
use Symfony\Component\HttpKernel\KernelEvents;
use Vich\UploaderBundle\Storage\StorageInterface;

class ResolveMediaContentUrlSubscriber implements EventSubscriberInterface
{
    /**
     * @var StorageInterface
     */
    private $storage;

    public function __construct(StorageInterface $storage)
    {
        $this->storage = $storage;
    }

    public static function getSubscribedEvents()
    {
        return [
            KernelEvents::VIEW => ['onPreSerialize', EventPriorities::PRE_SERIALIZE]
        ];
    }

    public function onPreSerialize(GetResponseForControllerResultEvent $event)
    {
        $controllerResult = $event->getControllerResult();
        $request = $event->getRequest();

        if ($controllerResult instanceof Response || !$request->attributes->getBoolean('_api_respond', true)) {
            return;
        }

        $attributes = RequestAttributesExtractor::extractAttributes($request);
        if (!$attributes ||  !\is_a($attributes['resource_class'], MediaObject::class, true))
        {
            return;
        }

        $mediaObjects = $controllerResult;

        if (!is_iterable($mediaObjects)) {
            $mediaObjects = [$mediaObjects];
        }

        foreach ($mediaObjects as $mediaObject) {
            if (!$mediaObject instanceof MediaObject) {
                continue;
            }

            $contentUrl = $this->storage->resolveUri($mediaObject, 'file');
            $mediaObject->setContentUrl($contentUrl);
        }
    }
}
