#!/bin/sh

TOPDIR=$(readlink -sf $(dirname "$BASH_SOURCE"))

# build type [Debug|Release]
BUILD_TYPE=Debug

if [ $(nproc) > 2 ];then
    JOBS=$(($(nproc)-1))
else
    JOBS=1
fi

set -o pipefail
set -o errexit

# submodule
git submodule update --init

# OpenCL-ICD-Loader
if [ -d OpenCL-ICD-Loader/.git ];then
    pushd OpenCL-ICD-Loader && git clean -dxff && popd
else
    rm -fr OpenCL-ICD-Loader/build && mkdir OpenCL-ICD-Loader/build
fi
cmake   -S OpenCL-ICD-Loader -B OpenCL-ICD-Loader/build \
        -DOPENCL_ICD_LOADER_HEADERS_DIR=${TOPDIR}/OpenCL-Headers \
        -DCMAKE_BUILD_TYPE=${BUILD_TYPE} V=s 2>&1 | tee cmake__OpenCL-ICD-Loader.log && \
cmake --build ./OpenCL-ICD-Loader/build \
        --config ${BUILD_TYPE} -- -j ${JOBS} V=s 2>&1 | tee make_OpenCL-ICD-Loader.log

# OpenCL-CTS
if [ -d .git ];then
    git clean -dxff
else
    rm -fr build && mkdir ./build
fi
cmake   -S . -B build \
        -DCL_INCLUDE_DIR=${TOPDIR}/OpenCL-Headers \
        -DCL_LIB_DIR=${TOPDIR}/OpenCL-ICD-Loader/build \
        -DOPENCL_LIBRARIES=OpenCL -DCMAKE_BUILD_TYPE=${BUILD_TYPE} V=s \
        2>&1 | tee cmake_cts.log && \
cmake --build build --config ${BUILD_TYPE} -- -j ${JOBS} V=s \
        2>&1 | tee make_cts.log

