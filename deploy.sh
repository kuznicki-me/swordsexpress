#!/bin/bash

P=$(readlink -f "$0")

DIR="$(dirname $P)"

rm -rf $DIR/*

git checkout deploy.sh

cd $DIR/../backbone

grunt build

cp -r dist/* $DIR/

cd $DIR/

git add .

git commit -am "Deploy"

git push origin gh-pages
