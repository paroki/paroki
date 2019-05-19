#!/usr/bin/env bash

source "$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)/lib/common.sh"

print_header "Integration" "check nginx status"
run_command "service nginx status"

print_header "Integration" "check nginx output"
run_command "curl http://siap.localhost/"
