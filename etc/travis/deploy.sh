#!/bin/bash

ssh -i ./deploy_key travis@$IP -p $PORT <<EOF
  cd $DEPLOY_DIR
  git pull origin master
  cd api
  composer install --ansi
  cd ../client
  yarn install
  yarn build
  cd ../
  ./api/bin/console doctrine:query:sql 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"'
  ./api/bin/console doctrine:database:create --if-not-exists
  ./api/bin/console doctrine:schema:update --force
  ./api/bin/console cache:clear
EOF

exit 0
