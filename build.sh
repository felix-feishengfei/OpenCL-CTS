#!/bin/sh

TOPDIR=$(readlink -sf $(dirname "$BASH_SOURCE"))

# submodule
git submodule update --init

# OpenCL-ICD-Loader
cmake   -S OpenCL-ICD-Loader \
        -B OpenCL-ICD-Loader/build \
        -DOPENCL_ICD_LOADER_HEADERS_DIR=${TOPDIR}/OpenCL-Headers \
        2>&1 | tee cmake_icdloader.log
cmake --build ./OpenCL-ICD-Loader/build \
        --config Release -- -j `nproc` V=s \
        2>&1 | tee make_icdloader.log

# OpenCL-CTS
cmake   -S . -B build \
        -DCL_INCLUDE_DIR=${TOPDIR}/OpenCL-Headers \
        -DCL_LIB_DIR=${TOPDIR}/OpenCL-ICD-Loader/build \
        -DOPENCL_LIBRARIES=OpenCL \
        2>&1 | tee cmake_cts.log
cmake --build build --config Release -- -j `nproc` V=s \
        2>&1 | tee  make_cts.log

