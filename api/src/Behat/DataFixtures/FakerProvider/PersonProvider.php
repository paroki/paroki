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

namespace SIAP\Behat\DataFixtures\FakerProvider;

use Faker\Provider\id_ID\Person as BasePersonID;

class PersonProvider extends BasePersonID
{
    public const GENDER_MALE   = 1;
    public const GENDER_FEMALE = 2;

    protected static $baptismMaleName = [
        'adrianus', 'agustinus', 'albertus', 'alexander', 'anastasius', 'andreas', 'antonius', 'benediktus', 'bonifasius', 'christian', 'damianus', 'daniel', 'dominikus', 'fidelis',
        'filipus', 'florentinus', 'fransiskus', 'gabriel', 'gregorius', 'hendrikus', 'ignasius', 'ignatius', 'kornelius', 'kristian', 'laurensius', 'laurentius', 'leonardus',
        'lukas', 'markus', 'marselinus', 'martinus', 'matius', 'mikael', 'paulus', 'petrus', 'pratama', 'putra', 'rafael', 'robertus', 'saputra', 'stefanus', 'vinsensius', 'xaverius',
        'yakobus', 'yohanes', 'yosef', 'yulianus', 'yulius', 'yustinus', 'yuventius',
    ];

    protected static $baptismFemaleName = [
        'agata', 'agnes', 'agustina', 'albina', 'anastasia', 'angela', 'benedikta', 'birgita',
        'clara', 'dewi', 'diana', 'elisabet', 'elisabeth', 'emilia', 'emiliana', 'florentina',
        'fransiska', 'helena', 'katarina', 'klara', 'kresensia', 'kristina', 'magdalena',
        'margareta', 'margaretha', 'marselina', 'marsiana', 'marta', 'martina', 'monika',
        'natalia', 'paulina', 'rosalina', 'rufina', 'sari', 'sesilia', 'sisilia', 'susana',
        'teresia', 'theresia', 'valentina', 'veronika', 'vinsensia', 'yohana', 'yosefa',
        'yulia', 'yuliana', 'yulita', 'yustina',
    ];

    /**
     * For academic title.
     *
     * @see http://id.wikipedia.org/wiki/Gelar_akademik
     */
    protected static $suffix = ['S.Ked', 'S.Gz', 'S.Pt', 'S.IP', 'S.E.I',
        'S.E.', 'S.Kom', 'S.H.', 'S.T.', 'S.Pd', 'S.Psi', 'S.I.Kom',
        'S.Sos', 'S.Farm', 'M.M.', 'M.Kom.', 'M.TI.', 'M.Pd', 'M.Farm', 'M.Ak', ];

    protected static $baptismMaleNameFormats = [
        '{{baptismMaleName}} {{firstNameMale}}',
        '{{baptismMaleName}} {{lastNameMale}}',
        '{{baptismMaleName}} {{firstNameMale}} {{lastNameMale}}',
    ];

    protected static $baptismFemaleNameFormats = [
        '{{baptismFemaleName}} {{firstNameFemale}}',
        '{{baptismFemaleName}} {{lastNameFemale}}',
        '{{baptismFemaleName}} {{firstNameFemale}} {{lastNameFemale}}',
    ];

    /**
     * @param string|null $gender 'male', 'female' or null for any
     *
     * @return string
     *
     * @example 'John Doe'
     */
    public function baptismName($gender = null)
    {
        $gender = (int) $gender;
        if ($gender === static::GENDER_MALE) {
            $format = static::randomElement(static::$baptismMaleNameFormats);
        } elseif ($gender === static::GENDER_FEMALE) {
            $format = static::randomElement(static::$baptismFemaleNameFormats);
        } else {
            $format = static::randomElement(array_merge(static::$baptismMaleNameFormats, static::$baptismFemaleNameFormats));
        }

        return $this->generator->parse($format);
    }

    public function baptismMaleName()
    {
        return ucfirst(
            static::randomElement(static::$baptismMaleName)
        );
    }

    public function baptismFemaleName()
    {
        return ucfirst(
            static::randomElement(static::$baptismFemaleName)
        );
    }

    public function halamanBaptis($index)
    {
        $value = floor($index / 10) + 1;

        return (int) $value;
    }
}
