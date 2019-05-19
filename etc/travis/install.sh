#!/usr/bin/env bash
set -e

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

code=0
BUILD_DIR=$PWD
SITE_DOMAIN=siap.localhost

if [[ $API = yes || $COVERAGE = yes || $INTEGRATION = yes ]]; then
  cp etc/travis/config/env.local api/.env.local
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
 run_command "cd ${BUILD_DIR}"
 chmod 775 -Rvf client/dist
 sudo gpasswd -a www-data travis
 sduo chown travis:www-data -R client/dist
 php-fpm --fpm-config ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.conf.default --define cgi.fix_pathinfo=0 -i | grep cgi.fix_pathinfo
 php-fpm --fpm-config ~/.phpenv/versions/$(phpenv version-name)/etc/php-fpm.conf.default --define cgi.fix_pathinfo=0 && ps -C php-fpm
 sudo cp etc/travis/config/nginx.conf /etc/nginx/sites-available/$SITE_DOMAIN
 sudo sed -e "s?%TRAVIS_BUILD_DIR%?$TRAVIS_BUILD_DIR?g" --in-place /etc/nginx/sites-available/$SITE_DOMAIN
 sudo sed -e "s?%SITE_DOMAIN%?$SITE_DOMAIN?g" --in-place /etc/nginx/sites-available/$SITE_DOMAIN
 sudo ln -s /etc/nginx/sites-available/$SITE_DOMAIN /etc/nginx/sites-enabled/
 sudo service nginx status
 sudo service nginx restart
 cp etc/travis/config/client.local client/.env.local
fi;

exit ${code}
