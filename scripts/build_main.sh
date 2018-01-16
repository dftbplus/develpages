#!/bin/bash

jekylldir="$1"
targetdir="$2"

cd $jekylldir
jekyll build -d $targetdir -q
touch $targetdir/.nojekyll
