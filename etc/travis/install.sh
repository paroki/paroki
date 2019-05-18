if [[ $API = yes || $COVERAGE = yes ]]; then
  cp etc/travis/env.local api/.env.local;
  cd $TRAVIS_BUILD_DIR/api;
  composer install --ansi;
  composer prepare-test --ansi;
fi;

if [[ $CLIENT = yes || $COVERAGE = yes ]]; then
  cd $TRAVIS_BUILD_DIR/client;
  yarn;
fi;

if [[ $DEPLOY = yes ]]; then
  cd $TRAVIS_BUILD_DIR/client;
  yarn build;
fi;

if [[ $INTEGRATION = yes ]]; then
  docker-compose pull
  docker-compose build
  docker-compose up -d
fi;
