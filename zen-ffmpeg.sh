#!/bin/bash

# Copyright (C) 2014 - Sebastien Alaiwan
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

function ffmpeg_build {
  host=$1
  pushDir $WORK/src

  lazy_git_clone git://source.ffmpeg.org/ffmpeg.git ffmpeg c2eb668617555cb8b8bcfb9796241ada9471ac65

  local ARCH=$(get_arch $host)
  local OS=$(get_os $host)

  # remove stupid dependency
  sed -i "s/jack_jack_h pthreads/jack_jack_h/" ffmpeg/configure

  mkdir -p ffmpeg/build/$host
  pushDir ffmpeg/build/$host
  ../../configure \
    --arch=$ARCH \
    --target-os=$OS \
    --prefix=$PREFIX/$host \
    --extra-cflags="-DWIN32=1 -I$PREFIX/$host/include" \
    --enable-pthreads \
    --disable-w32threads \
    --extra-ldflags="-L$PREFIX/$host/lib" \
    --disable-debug \
    --disable-static \
    --enable-shared \
    --enable-libass \
    --enable-fontconfig \
    --enable-librtmp \
    --enable-gpl \
    --enable-nonfree \
    --enable-libfdk_aac \
    --enable-libx264 \
    --enable-libx265 \
    --enable-zlib \
    --disable-gnutls \
    --disable-openssl \
    --disable-gnutls \
    --disable-openssl \
    --disable-iconv \
    --disable-bzlib \
    --enable-avresample \
    --pkg-config=pkg-config \
    --cross-prefix=$host-
  $MAKE
  $MAKE install
  popDir

  popDir
}

function ffmpeg_get_deps {
  echo libass
  echo fontconfig
  echo librtmp
  echo libfdk-aac
  echo x264
  echo x265
  echo zlib
}

