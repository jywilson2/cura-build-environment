#!/bin/bash

set -e
set -x

cbe_src_dir=~/develop/cura/cura-build-environment
cbe_install_dir=~/develop/cura/cura-build-environment/install

cd $cbe_src_dir
mkdir -p build
cd build

# Set some environment variables to make sure that the installed tools can be found.
export PATH=$cbe_install_dir/bin:$PATH
export PKG_CONFIG_PATH=$cbe_install_dir/lib/pkgconfig:$PKG_CONFIG_PATH
export LD_LIBRARY_PATH=$cbe_install_dir/lib:$LD_LIBRARY_PATH

cmake -DCMAKE_BUILD_TYPE=Release \
      -DCMAKE_INSTALL_PREFIX=$cbe_install_dir \
      -DCMAKE_PREFIX_PATH=$cbe_install_dir \
      ..
make -j16

