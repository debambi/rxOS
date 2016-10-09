#!/bin/sh
#
# handle opaks
#
# This file is part of rxOS.
# rxOS is free software licensed under the
# GNU GPL version 3 or any later version.
#
# (c) 2016 Outernet Inc
# Some rights reserved.
USAGE='opakhandler SOURCEFILE DESTINATION [SOURCEDIR]'
TAR='/bin/tar'
ONFSCHANGE='/usr/bin/oncontentchange'

if [ $# -lt 2 ]
then
  echo >&2 "$USAGE"
  exit 1
fi

SOURCEFILE="$1"
DESTINATION="$2"
SOURCEDIR="$3"

if [ -f "$SOURCEFILE" ]
then
    echo "Discovered '$SOURCEFILE', extracting..."
    $TAR xf "$SOURCEFILE" --directory "$DESTINATION" && rm "$SOURCEFILE"
    $ONFSCHANGE
fi