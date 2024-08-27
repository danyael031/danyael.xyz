#!/bin/env bash

set -e -u

npm run build
rsync -rtvzP ./dist/ danyael.xyz:/var/www/www.danyael.xyz
