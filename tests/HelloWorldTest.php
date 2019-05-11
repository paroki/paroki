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

namespace SIAP\Tests;

use PHPUnit\Framework\TestCase;

/**
 * Hello World test.
 */
class HelloWorldTest extends TestCase
{
    public function testHelloWorld()
    {
        $foo = 'hello world';
        $this->assertEquals('hello world', $foo);
    }
}
