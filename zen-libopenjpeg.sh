#!/bin/bash

# Copyright (C) 2014 - Badr BADRI
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

function libopenjpeg_build {

  local host=$1
  pushDir $WORK/src
  
  svn co http://openjpeg.googlecode.com/svn/trunk/ libopenjpeg -r 2989
  pushDir libopenjpeg
  svn revert -R .
  popDir

  mkdir -p libopenjpeg/build/$host
  pushDir libopenjpeg/build/$host
  cmake -DCMAKE_INSTALL_PREFIX=$PREFIX/$host ../../
  $MAKE
  $MAKE install
  popDir

  popDir

}

function libopenjpeg_get_deps {
 local a=0
}
