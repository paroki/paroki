if [[ $CLIENT != yes || $INTEGRATION == yes ]]; then
  cp etc/travis/env.local api/.env.local;
  cd $TRAVIS_BUILD_DIR/api;
  composer install --ansi;
  composer prepare-test --ansi;
fi;

if [[ $CLIENT == yes || $INTEGRATION == yes ]]; then
  cd $TRAVIS_BUILD_DIR/client;
  yarn install;
fi;

if [[ $INTEGRATION == yes || $DEPLOY == yes ]]; then
  cd $TRAVIS_BUILD_DIR/client;
  yarn build;
fi;
