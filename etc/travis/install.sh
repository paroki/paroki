#!/usr/bin/env bash

set -e

code=0
BUILD_DIR=$PWD
SITE_DOMAIN=siap.dev

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

if [[ $API = yes || $COVERAGE = yes || $INTEGRATION = yes ]]; then
  cp etc/travis/env.local api/.env.local
  cd ${BUILD_DIR}/api
  run_command "composer install --ansi"
  run_command "composer prepare-test --ansi"
fi;

if [[ $CLIENT = yes || $COVERAGE = yes || $INTEGRATION = yes ]]; then
  run_command "cd ${BUILD_DIR}/client"
  yarn;
fi;

if [[ $DEPLOY = yes || $INTEGRATION = yes ]]; then
  run_command "cd ${BUILD_DIR}/client"
  yarn build;
fi;

if [[ $INTEGRATION = yes ]]; then
 sudo cp etc/travis/nginx.conf /etc/nginx/sites-available/$SITE_DOMAIN
 sudo sed -e "s?%TRAVIS_BUILD_DIR%?$TRAVIS_BUILD_DIR?g" --in-place /etc/nginx/sites-available/$SITE_DOMAIN
 sudo sed -e "s?%SITE_DOMAIN%?$SITE_DOMAIN?g" --in-place /etc/nginx/sites-available/$SITE_DOMAIN

 # enable the site by creating a symbolic link in the `sites-enabled` folder
 sudo ln -s /etc/nginx/sites-available/$SITE_DOMAIN /etc/nginx/sites-enabled/
fi;

exit ${code}
