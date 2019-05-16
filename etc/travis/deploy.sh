#!/bin/bash

ssh -i ./deploy_key travis@$IP -p $PORT <<EOF
  cd $DEPLOY_DIR
  git pull origin master
  cd api
  composer install --ansi
  cd ../
  ./api/bin/console doctrine:query:sql 'CREATE EXTENSION IF NOT EXISTS "uuid-ossp"' --ansi
  ./api/bin/console doctrine:database:create --if-not-exists --ansi
  ./api/bin/console doctrine:schema:update --force --ansi
  ./api/bin/console cache:clear --ansi
EOF

exit 0
