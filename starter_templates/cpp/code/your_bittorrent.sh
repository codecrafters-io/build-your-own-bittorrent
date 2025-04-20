#!/bin/sh
#
set -e
# vcpkg & cmake are required. 
cmake -B build -S . -DCMAKE_TOOLCHAIN_FILE=${VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake
cmake --build ./build
exec ./build/bittorrent "$@"