#!/usr/bin/env bash

cd /
git clone https://github.com/ziglang/zig.git zig-git

cd zig-git

mkdir build
cd build
cmake ..
make install
cp stage3/bin/zig /zig
