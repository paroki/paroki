#!/usr/bin/env bash

set -e

if [[ $COVERAGE = yes ]]; then

    cd $TRAVIS_BUILD_DIR

    wget https://github.com/php-coveralls/php-coveralls/releases/download/v2.1.0/php-coveralls.phar
    chmod +x php-coveralls.phar

    travis_retry ./php-coveralls.phar --json_path=api/build/logs/coveralls-upload.json -vvv -x $TRAVIS_BUILD_DIR/api/build/logs/clover.xml

    wget https://scrutinizer-ci.com/ocular.phar
    travis_retry php ocular.phar code-coverage:upload --format=php-clover api/build/logs/clover.xml

    wget https://codecov.io/bash
    chmod +x bash
    ./bash -F client -s client/build/logs/ -f "*.xml"
fi
