#!/usr/bin/env bash

git checkout gh-pages

cp -R resources/public/java/* ./

git add ./

git reset -- update-gh-pages.sh

if [ $# != 0 ]; then
    git commit -m "$1"
fi

git branch

git status
