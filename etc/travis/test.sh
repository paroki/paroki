#!/usr/bin/env bash

EXIT_CODE=0
PHPSPEC_OPTS=""
PHPUNIT_OPTS=""
BEHAT_OPTS=""
JEST_OPTS=""

PHP_CMD=php
JEST_CMD="yarn test:unit"
test=`which phpdbg`

if [[ ${test} && ${COVERAGE} = yes ]]; then
    PHP_CMD="${test} -qrr";
fi;

if [[ ${COVERAGE} = yes ]]; then
    PHPSPEC_OPTS="--config phpspec-coverage.yml";
    PHPUNIT_OPTS="--coverage-php=build/cov/coverage-phpunit.cov";
    BEHAT_OPTS="--profile coverage";
    JEST_OPTS="--coverage";
fi;

if [[ ${API} = yes || ${COVERAGE} = yes ]]; then
    cd api
    ${PHP_CMD} ./vendor/bin/phpspec run --ansi ${PHPSPEC_OPTS} || EXIT_CODE=1;
    ${PHP_CMD} ./vendor/bin/phpunit --colors=always ${PHPUNIT_OPTS} || EXIT_CODE=1;
    ${PHP_CMD} ./vendor/bin/behat --colors ${BEHAT_OPTS} || EXIT_CODE=1;
    cd ..
fi;

if [[ ${COVERAGE} = yes || ${CLIENT} = yes ]]; then
  cd client;
  ${JEST_CMD} --colors ${JEST_OPTS};
  cd ..;
fi;

if [[ ${COVERAGE} = yes ]]; then
    cd api
    ./vendor/bin/phpcov merge --clover build/logs/clover.xml build/cov;
    ./vendor/bin/phpcov merge --html build/html build/cov;
    cd ..
fi;

exit ${EXIT_CODE}
