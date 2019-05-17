#!/usr/bin/env bash

EXIT_CODE=0
PHPSPEC_OPTS=""
PHPUNIT_OPTS=""
BEHAT_OPTS=""

PHP_CMD=php
test=`which phpdbg`

cd api

if [[ ${test} && ${COVERAGE} == yes ]]; then
    PHP_CMD="${test} -qrr";
fi;

if [[ ${COVERAGE} == yes ]]; then
    PHPSPEC_OPTS="--config phpspec-coverage.yml";
    PHPUNIT_OPTS="--coverage-php=build/cov/coverage-phpunit.cov";
    BEHAT_OPTS="--profile coverage";
fi;

if [[ ${INTEGRATON} != yes ]]; then
    ${PHP_CMD} ./vendor/bin/phpspec run --ansi ${PHPSPEC_OPTS} || EXIT_CODE=1;
    ${PHP_CMD} ./vendor/bin/phpunit --colors=always ${PHPUNIT_OPTS} || EXIT_CODE=1;
    ${PHP_CMD} ./vendor/bin/behat --colors ${BEHAT_OPTS} || EXIT_CODE=1;
fi;

if [[ ${COVERAGE} == yes ]]; then
    ./vendor/bin/phpcov merge --clover build/logs/clover.xml build/cov;
    ./vendor/bin/phpcov merge --html build/html build/cov;
fi;

cd ..
exit ${EXIT_CODE}
