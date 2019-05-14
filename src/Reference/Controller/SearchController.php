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

namespace SIAP\Reference\Controller;

use SIAP\Reference\Entity\Paroki;
use SIAP\Reference\Services\SearchService;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Routing\Annotation\Route;

class SearchController
{
    /**
     * @Route(
     *     name="siap_search_paroki",
     *     path="/api/reference/search/paroki",
     *     methods={"GET"},
     *     defaults={
     *         "_api_resource_class"=Paroki::class,
     *         "_api_collection_operation_name"="search"
     *     }
     * )
     */
    public function searchParoki(Request  $request, SearchService $service)
    {
        $terms = $request->get('terms');

        return $service->searchParoki($terms);
    }
}
