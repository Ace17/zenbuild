#!/bin/bash

# Copyright (C) 2016 - Sebastien Alaiwan
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.

function libsdl2_get_deps {
  local a=0
}

function libsdl2_build {

  local host=$1
  pushDir $WORK/src

  lazy_download "libsdl2.tar.gz" "https://www.libsdl.org/release/SDL2-2.0.3.tar.gz"
  lazy_extract "libsdl2.tar.gz"

  autoconf_build $host "libsdl2"

  popDir
}

