#!/usr/bin/env bash

set -e

code=0
BUILD_DIR=$PWD

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

if [[ $API = yes || $COVERAGE = yes ]]; then
  cp etc/travis/env.local api/.env.local
  cd ${BUILD_DIR}/api
  run_command "composer install --ansi"
  run_command "composer prepare-test --ansi"
fi;

if [[ $CLIENT = yes || $COVERAGE = yes ]]; then
  run_command "cd ${BUILD_DIR}/client"
  yarn;
fi;

if [[ $DEPLOY = yes ]]; then
  run_command "cd ${BUILD_DIR}/client"
  yarn build;
fi;

if [[ $INTEGRATION = yes ]]; then
  docker-compose pull
  docker-compose build --pull
  docker-compose up -d
  docker-compose exec php composer install
fi;

exit ${code}
