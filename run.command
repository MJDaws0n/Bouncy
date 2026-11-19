#!/bin/zsh
set -eu
cd "${0:A:h}"
if [[ ! -x lib/window/window_manager ]]; then
    (cd lib/window && bash unbuilt/build.sh)
fi
novus main.nov
mkdir -p Bouncy.app/Contents/MacOS
cp lib/window/window_manager Bouncy.app/Contents/MacOS/window_manager
exec ./build/darwin_arm64/main
