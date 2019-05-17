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

namespace SIAP\Behat\Contexts;

use Behat\Behat\Context\Context;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;
use Behat\Gherkin\Node\PyStringNode;
use Behatch\Context\RestContext;

class CustomContext implements Context
{
    /**
     * @var RestContext
     */
    private $restContext;

    /**
     * @BeforeScenario
     */
    public function gatherContexts(BeforeScenarioScope $scope)
    {
        $this->restContext = $scope->getEnvironment()->getContext(RestContext::class);
    }

    /**
     * @Given I send a JSON :method request to :url
     *
     * @param string $method
     * @param string $url
     * @param array  $files
     */
    public function iSendJsonRequestTo($method, $url, PyStringNode $body = null, $files = [])
    {
        $restContext = $this->restContext;

        $restContext->iAddHeaderEqualTo('Content-Type', 'application/json');
        $restContext->iAddHeaderEqualTo('Accept', 'application/json');
        $restContext->iSendARequestTo($method, $url, $body);
    }

    /**
     * @Given I send a JSON :method request to :url with body:
     *
     * @param string $method
     * @param string $url
     */
    public function iSendJsonRequestToWithBody($method, $url, PyStringNode $body = null)
    {
        $this->iSendJsonRequestTo($method, $url, $body);
    }
}
