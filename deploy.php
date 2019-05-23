<?php
namespace Deployer;

require 'recipe/common.php';

// Project name
set('application', 'siap');

// Project repository
set('repository', 'https://github.com/paroki/siap.git');

// [Optional] Allocate tty for git clone. Default value is false.
set('git_tty', true);
set('git_cache', true);

// Shared files/dirs between deploys 
add('shared_files', []);
add('shared_dirs', ['api/public/media']);

// Writable dirs by web server 
add('writable_dirs', [
    'api/public/media',
    'api/public/vars'
]);


// Hosts

host('itstoni.com')
    ->set('deploy_path', '/srv/{{application}}')
    ->set('branch','master')
;
    
// Tasks

task('build', function () {
    run('cd {{release_path}} && build');
});

// [Optional] if deploy fails automatically unlock.
after('deploy:failed', 'deploy:unlock');

// Migrate database before symlink new release.

//before('deploy:symlink', 'database:migrate');

task('deploy:vendors', function(){
    run('cp /srv/siap/env.local {{release_path}}/api/.env.local');
    run('cd {{release_path}}/api && composer install');
    run('cd {{release_path}}/api && bin/console doctrine:query:sql \'create extension if not exists "uuid-ossp"\'');
    run('cd {{release_path}}/api && bin/console doctrine:schema:update --force');
    upload('./client/dist','{{release_path}}/client/dist');
});

task('deploy', [
    'deploy:prepare',
    'deploy:lock',
    'deploy:release',
    'deploy:update_code',
    'deploy:shared',
    'deploy:writable',
    'deploy:vendors',
    'deploy:clear_paths',
    'deploy:symlink',
    'deploy:unlock',
    'cleanup',
    'success'
]);
