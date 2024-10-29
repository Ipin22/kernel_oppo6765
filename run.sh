#!/bin/bash
# set environment variables
git clone --depth=1 https://github.com/Ipin22/clang clang
export KBUILD_BUILD_HOST="los18.1"
export KBUILD_BUILD_USER="ipin22"
export PATH="$(pwd)/clang/bin:$PATH"
export LOCALVERSION="-lineage"
# build kernel
make -j$(nproc --all) O=out ARCH=arm64 oppo6765_19451_defconfig
make -j16 ARCH=arm64 O=out \
                      HOSTCC="ccache clang" \
                      HOSTCXX="ccache clang++" \
                      CC="ccache clang" \
                      CROSS_COMPILE=aarch64-linux-gnu- \
                      CROSS_COMPILE_ARM32=arm-linux-gnueabi-
