#!/usr/bin/env bash

sudo apt install --no-install-recommends git cmake ninja-build gperf \
  ccache dfu-util device-tree-compiler wget python3-dev python3-venv python3-tk \
  xz-utils file make gcc gcc-multilib g++-multilib libsdl2-dev libmagic1

if [ ! -d ".venv" ]; then
  python3 -m venv .venv;
  source .venv/bin/activate;
  pip install west;
  west packages pip --install;
else
  source .venv/bin/activate;
fi

if [ -d zephyr-sdk-* ]; then
  echo "SDK already present.";
else
  west sdk install -b $(pwd) --toolchains arm-zephyr-eabi;
fi