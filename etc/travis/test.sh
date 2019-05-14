#!/usr/bin/env bash

EXIT_CODE=0
PHPSPEC_OPTS=""
PHPUNIT_OPTS=""
BEHAT_OPTS=""

PHP_CMD=php
test=`which phpdbg`

if [[ ${test} && ${COVERAGE} == yes ]]; then
    PHP_CMD="${test} -qrr";
fi;

if [[ ${COVERAGE} == yes ]]; then
    PHPSPEC_OPTS="--config=etc/travis/phpspec-coverage.yml";
    PHPUNIT_OPTS="--coverage-php=build/cov/coverage-phpunit.cov";
    BEHAT_OPTS="--profile coverage";
fi;

${PHP_CMD} ./api/vendor/bin/phpspec run --ansi ${PHPSPEC_OPTS} || EXIT_CODE=1
${PHP_CMD} ./api/vendor/bin/phpunit -c api --colors=always ${PHPUNIT_OPTS} || EXIT_CODE=1
${PHP_CMD} ./api/vendor/bin/behat -c api/behat.yml.dist --colors ${BEHAT_OPTS} || EXIT_CODE=1

if [[ ${COVERAGE} == yes ]]; then
    ./api/vendor/bin/phpcov merge --clover build/logs/clover.xml build/cov;
    ./api/vendor/bin/phpcov merge --html build/html build/cov;
fi;

exit ${EXIT_CODE}
