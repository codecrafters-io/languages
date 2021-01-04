#!/bin/sh
#
# DON'T EDIT THIS!
#
# CodeCrafters uses this file to test your code. Don't make any changes here!
#
# DON'T EDIT THIS!
#node_modules/.bin/tsc --build tsconfig.json
ls node_modules
ls node_modules/.bin
pwd
tsc --build tsconfig.json
exec node app/main.js
