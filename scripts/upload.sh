#! /usr/bin/env bash

cd /tmp
git clone https://github.com/Roomify/casa_build.git
cd casa_build

git config user.email "hello@roomify.us"
git config user.name "Travis CI"
git config credential.helper "store --file=.git/credentials"
echo "https://${GH_TOKEN}:@github.com" > .git/credentials

git checkout gh-pages
cp /tmp/screenshots/* .

git add .

git commit -m "Travis CI build ${TRAVIS_BUILD_NUMBER}"
git push origin gh-pages
