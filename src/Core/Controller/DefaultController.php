<?php


namespace Paroki\Core\Controller;


use Symfony\Bundle\FrameworkBundle\Controller\AbstractController;
use Symfony\Component\HttpFoundation\Response;
use Symfony\Component\Routing\Annotation\Route;

class DefaultController extends AbstractController
{
    /**
     * @Route("/", name="homepage")
     * @Route(
     *     name="vue_pages",
     *     path="/{route}",
     *     requirements={"route"="^(?!.*_wdt|_profiler).+"}
     * )
     */
    public function index()
    {
        return new Response($this->renderView('home.html.twig'));
    }
}
