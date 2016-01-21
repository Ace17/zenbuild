#!/bin/bash

# Copyright (C) 2016 - Sebastien Alaiwan
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.

function libsdl1_get_deps {
  local a=0
}

function libsdl1_build {

  local host=$1
  pushDir $WORK/src

  lazy_download "libsdl1.tar.gz" "http://libsdl.org/release/SDL-1.2.15.tar.gz"
  lazy_extract "libsdl1.tar.gz"

  autoconf_build $host "libsdl1"
 
  popDir
}

