<?php


namespace SIAP\Reference\Controller;


use SIAP\Reference\Services\SearchService;
use Symfony\Component\HttpFoundation\JsonResponse;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;
use SIAP\Reference\Entity\Paroki;

class SearchController
{

    /**
     * @Route(
     *     name="siap_search_paroki",
     *     path="/api/reference/search/paroki",
     *     methods={"GET"},
     *     defaults={
     *          "_api_resource_class" = Paroki::class,
     *          "_api_collection_operation_name" = "search"
     *     }
     * )
     */
    public function searchParoki(Request  $request, SearchService $service)
    {

        $terms = $request->get('terms');
        return $service->searchParoki($terms);
    }
}
