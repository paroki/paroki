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

namespace SIAP\Core\Test;

trait MutableSpecTrait
{
    abstract public function getMutableProperties();

    abstract public function getMutableClassToTest();

    /**
     * @throws \ReflectionException
     */
    public function its_properties_should_be_mutable()
    {
        $properties = $this->getMutableProperties();
        $r          = new \ReflectionClass($this->getMutableClassToTest());
        foreach ($properties as $method => $value) {
            $setter = 'set'.$method;
            $getter = 'get'.$method;

            if ($r->hasMethod('add'.$method)) {
                $this->handleCollectionProperties($method, $value);
            } else {
                if ($r->hasMethod($setter)) {
                    $this->{$setter}($value)->shouldReturn($this);
                }
                if ($r->hasMethod($getter)) {
                    $this->{$getter}()->shouldReturn($value);
                }
            }
        }
    }

    private function handleCollectionProperties($method, $value)
    {
        $has    = 'has'.$method;
        $add    = 'add'.$method;
        $remove = 'remove'.$method;

        $this->{$add}($value)->shouldReturn($this);
        $this->{$has}($value)->shouldReturn(true);

        $this->{$remove}($value)->shouldReturn($this);
        $this->{$has}($value)->shouldReturn(false);
    }
}
