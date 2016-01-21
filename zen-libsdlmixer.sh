#!/bin/bash

# Copyright (C) 2016 - Sebastien Alaiwan
# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License
# as published by the Free Software Foundation; either version 3
# of the License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.

function libsdlmixer_get_deps {
  echo "libsdl1"
  echo "mikmod"
}

function libsdlmixer_build {

  local host=$1
  pushDir $WORK/src

  lazy_download "libsdlmixer.tar.gz" "https://www.libsdl.org/projects/SDL_mixer/release/SDL_mixer-1.2.12.tar.gz"
  lazy_extract "libsdlmixer.tar.gz"

  # PATH must be patched to find the right libmikmod-config
  PATH=$PREFIX/$host/bin:$PATH \
    libsdlmixer_internal_build $host

  popDir
}

function libsdlmixer_internal_build
{
  local host=$1
  autoconf_build $host "libsdlmixer"
}
