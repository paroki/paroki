<?php


namespace SIAP\Core\Test;


use Doctrine\Common\Collections\Collection;

trait MutableSpecTrait
{
    abstract function getMutableProperties();

    abstract function getMutableClassToTest();

    function its_properties_should_be_mutable()
    {
        $properties = $this->getMutableProperties();
        $r = new \ReflectionClass($this->getMutableClassToTest());
        foreach($properties as $method => $value){

            $setter = "set".$method;
            $getter = "get".$method;

            $value = is_null($value) ? 'some-value':$value;

            if($r->hasMethod('add'.$method)){
                $this->handleCollectionProperties($method, $value);
            }else{
                $this->$setter($value)->shouldReturn($this);
                $this->$getter()->shouldReturn($value);
            }
        }
    }

    private function handleCollectionProperties($method, $value)
    {
        $has = 'has'.$method;
        $add = 'add'.$method;
        $remove = 'remove'.$method;


        $this->$add($value)->shouldReturn($this);
        $this->$has($value)->shouldReturn(true);

        $this->$remove($value)->shouldReturn($this);
        $this->$has($value)->shouldReturn(false);
    }

}
