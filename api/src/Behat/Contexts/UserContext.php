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

use FOS\UserBundle\Model\UserManagerInterface;
use FOS\UserBundle\Util\TokenGeneratorInterface;
use SIAP\User\Entity\User;
use Behat\Behat\Context\Context;
use Behat\Behat\Hook\Scope\BeforeScenarioScope;
use Behat\Gherkin\Node\PyStringNode;
use Behatch\Context\RestContext;
use Lexik\Bundle\JWTAuthenticationBundle\Services\JWTManager;

class UserContext implements Context
{
    /**
     * @var JWTManager
     */
    private $jwtManager;

    /**
     * @var RestContext
     */
    private $restContext;

    /**
     * @var integer
     */
    private $retryTtl;

    /**
     * @var UserManagerInterface
     */
    private $userManager;

    /**
     * @var string
     */
    private $currentUsername;

    private $tokenGenerator;

    public function __construct(
        JWTManager $jwtManager,
        UserManagerInterface $userManager,
        TokenGeneratorInterface $tokenGenerator,
        $retryTtl
    )
    {
        $this->jwtManager = $jwtManager;
        $this->userManager = $userManager;
        $this->retryTtl = $retryTtl;
        $this->tokenGenerator = $tokenGenerator;
    }

    /**
     * @BeforeScenario
     */
    public function gatherContexts(BeforeScenarioScope $scope)
    {
        $this->restContext = $scope->getEnvironment()->getContext(RestContext::class);
    }

    /**
     * @param string $username
     *
     * @param string $password
     * @param string $role
     * @return User|object|null
     */
    public function thereIsUser($username, $password = 'password', $role= 'ROLE_ADMIN')
    {
        $userManager = $this->userManager;
        $user     = $userManager->findUserByUsername($username);
        $password = null === $password ? $username : $password;

        if (null === $user) {
            $user = $userManager->createUser();
        }
        $user
            ->setNama($username.' user')
            ->setUsername($username)
            ->setEmail($username.'@test.com')
            ->setPlainPassword($password)
            ->setEnabled(true);

        $user->addRole($role);
        $userManager->updateUser($user);

        return $user;
    }

    /**
     * @Given there is an admin user with username :username
     * @Given there is an admin user with username :username and password :password
     *
     * @param string $username
     * @param string $password
     *
     * @return User
     */
    public function thereIsAdminUserWith($username, $password = 'password')
    {
        return $this->thereIsUser($username, $password, 'ROLE_ADMIN');
    }

    /**
     * @Given I have logged in as admin
     */
    public function iHaveLoggedInAsAdmin()
    {
        $user  = $this->thereIsAdminUserWith('admin', 'admin');
        $token = $this->jwtManager->create($user);
        $this->restContext->iAddHeaderEqualTo('Authorization', 'Bearer '.$token);
    }

    /**
     * @Given I have logged in with username :username
     */
    public function iHaveLoggedInWith($username)
    {
        $user  = $this->thereIsUser($username);
        $token = $this->jwtManager->create($user);
        $this->restContext->iAddHeaderEqualTo('Authorization', 'Bearer '.$token);
    }

    /**
     * @Given I have request reset password for user :username
     * @Given I have request reset password
     * @param string $username
     * @throws \Exception
     */
    public function iHaveRequestPassword($username = null)
    {
        $username = is_null($username) ? $this->currentUsername:$username;
        $user = $this->thereIsUser($username);
        $userManager = $this->userManager;

        $user->setPasswordRequestedAt(new \DateTime());

        $userManager->updateUser($user);
    }

    /**
     * @Given I have an expired request reset password for user :username
     * @Given I have an expired request reset password
     * @param string $username
     * @throws \Exception
     */
    public function iHaveAnExpiredRequestPassword($username = null)
    {
        $username = is_null($username) ? $this->currentUsername:$username;
        $user = $this->thereIsUser($username);
        $userManager = $this->userManager;

        $timestamp = (new \DateTime())->getTimestamp() - $this->retryTtl;
        $user->setPasswordRequestedAt(new \DateTime('@'.$timestamp));

        $userManager->updateUser($user);
    }

    /**
     * @Given My username is :username
     * @param string $username
     */
    public function myUsernameIs($username)
    {
        $this->thereIsUser($username);
        $this->currentUsername = $username;
    }

    /**
     * @Given I never request password
     * @Given I never request password for :username
     * @param string $username
     * @throws \Exception
     */
    public function iDonTRequestPassword($username=null)
    {
        $username = is_null($username) ? $this->currentUsername:$username;
        $user = $this->thereIsUser($username);
        $userManager = $this->userManager;

        if($user->getPasswordRequestedAt() instanceof \DateTime){
            $user->setPasswordRequestedAt(null);
            $userManager->updateUser($user);
        }
    }
}
