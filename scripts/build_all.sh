#!/bin/bash
################################################################################
# 
#
################################################################################

function fatalerror() {
  echo "Error: $1" >&2
  exit 1
}

function abspath() {
  if [ ! -d "$1" ]; then
    fatalerror "Invalid directory name '$1'"
  fi
  cd $1
  echo $PWD
}

function printhelp() {
  echo "" >&2
  echo "build_all <temporary-dir>" >&2
  echo "" >&2
  echo "Builds the development webpage for DFTB+. Script must be executed from the root" >&2
  echo "folder of the web page." >&2
}

function checkdir() {
  if [ ! -d "$1" ]; then
    fatalerror "Invalid $2 directory '$1'"
  fi
}

if [ -z "$1" ]; then
  echo "Error: missing argument" >&2
  printhelp
  exit 1
fi

if [ ! -d "$1" ]; then
  mkdir -p $1
fi

tmpdir="$(abspath $1)"
targetdir="$PWD"
scriptdir="$(abspath $(dirname $0))"

checkdir "$tmpdir" "temporary"
checkdir "$targetdir" "target"
checkdir "$scriptdir" "script"

if [ ! -d "$tmpdir" ]; then
  fatalerror "Invalid temporary directory '$tmpdir'"
fi

if [ ! -d "$tmpdir" ]; then
  fatalerror "Invalid temporary directory '$tmpdir'"
fi


$scriptdir/build_main.sh $scriptdir/../jekyll $targetdir
$scriptdir/build_mpifx.sh $targetdir/mpifx $tmpdir/mpifx
$scriptdir/build_scalapackfx.sh $targetdir/scalapackfx $tmpdir/scalapackfx
