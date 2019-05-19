#!/usr/bin/env bash

code=0

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

print_header "Integration" "check nginx status"
run_command "service nginx status" || code=1

print_header "Integration" "check nginx output"
run_command "curl http://siap.localhost" || code=2

print_header "Integration" "check api docs output"
run_command "curl http://siap.localhost/api/user.json" || code=3

print_header "Integration" "check nginx config"
run_command "cat /etc/nginx/sites-enabled/siap.localhost" || code=4

exit($code)
