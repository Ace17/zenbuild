#!/bin/bash

# Copyright (C) 2016 - Sebastien Alaiwan
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.

function mikmod_get_deps {
  local a=0
}

function mikmod_build {

  local host=$1
  pushDir $WORK/src

  lazy_download "mikmod.tar.gz" "http://downloads.sourceforge.net/project/mikmod/libmikmod/3.3.8/libmikmod-3.3.8.tar.gz"
  lazy_extract "mikmod.tar.gz"

  autoconf_build $host "mikmod"

  popDir
}

