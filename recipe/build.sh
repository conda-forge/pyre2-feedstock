#!/bin/bash
set -eux


# filter problematic arch flags from C[XX]FLAGS and increase optimization lvl
export CFLAGS=$(echo ${CFLAGS:-} | sed -e "s/-march[^ ]*//g")
export CXXFLAGS=$(echo ${CXXFLAGS:-} | sed -e "s/-march[^ ]*//g")
export CFLAGS=$(echo "${CFLAGS}" | sed "s/-O2/-O3/g")
export CXXFLAGS=$(echo "${CXXFLAGS}" | sed "s/-O2/-O3/g")
export LDFLAGS=$(echo "${LDFLAGS}" | sed "s/-O2/-O3/g")


$PREFIX/bin/python -m pip install . -vv
