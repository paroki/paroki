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
use Behat\Gherkin\Node\TableNode;
use Behat\MinkExtension\Context\MinkContext;
use Behatch\Context\RestContext;
use Symfony\Component\HttpFoundation\File\UploadedFile;
use Behatch\HttpCall\Request;

class CustomContext implements Context
{
    /**
     * @var RestContext
     */
    private $restContext;

    /**
     * @var MinkContext
     */
    private $minkContext;

    /**
     * @var UploadedFile[]
     */
    private $attachments;

    /**
     * @var string
     */
    private $cacheDir;

    /**
     * @var Request
     */
    private $request;

    /**
     * @var UserContext
     */
    private $userContext;

    /**
     * CustomContext constructor.
     * @param string $kernelCacheDir
     * @param Request $request
     */
    public function __construct(
        $kernelCacheDir,
        Request $request
    )
    {
        $this->cacheDir = $kernelCacheDir.'/uploaded_files';
        $this->request = $request;
        if(!is_dir($this->cacheDir)){
            mkdir($this->cacheDir, 0777, true);
        }
    }

    /**
     * @BeforeScenario
     */
    public function gatherContexts(BeforeScenarioScope $scope)
    {
        $this->restContext = $scope->getEnvironment()->getContext(RestContext::class);
        $this->minkContext = $scope->getEnvironment()->getContext(MinkContext::class);
        $this->userContext = $scope->getEnvironment()->getContext(UserContext::class);
        $this->attachments = [];
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

    /**
     * @When I upload file :name with:
     * @param string $path
     */
    public function iUploadFile($path, TableNode $table)
    {
        $minkContext = $this->minkContext;
        $request = $this->request;

        if ($minkContext->getMinkParameter('files_path')) {
            $fullPath = rtrim(realpath($minkContext->getMinkParameter('files_path')), DIRECTORY_SEPARATOR).DIRECTORY_SEPARATOR.$path;
            if (is_file($fullPath)) {
                $path = $fullPath;
            }
        }

        if(!is_file($path)){
            throw new \InvalidArgumentException(sprintf('File "%s" not  found.',$path));
        }

        $id = $this->userContext->thereIsUser('test')->getId();
        $cachePath = $this->cacheDir.DIRECTORY_SEPARATOR.basename($path);
        copy($path,$cachePath);
        $files = [
            'file' => $cachePath
        ];
        $parameters = [
            'type' => 'user',
            'property' => 'setFoto',
            'id' => $id
        ];
        $url = '/user/'.$id.'/upload-foto';
        $request->setHttpHeader('Accept','application/json');
        $request->send(
            'POST',
            $minkContext->locatePath($url),
            $parameters,
            $files
        );
    }
}
