#!/bin/sh
set -e

echo $PWD
yarn install
yarn dev-server
