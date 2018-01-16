#!/bin/bash

targetdir="$1"
tmpdir="$2"

mkdir -p $tmpdir
mkdir -p $targetdir

cd $tmpdir
git clone https://github.com/dftbplus/mpifx .

cd $tmpdir/doc/sphinx
make html
rsync -a --delete $tmpdir/doc/sphinx/_build/html/ $targetdir/manual

cd $tmpdir/doc/doxygen
doxygen
rsync -a --delete $tmpdir/doc/doxygen/_build/html/ $targetdir/api
