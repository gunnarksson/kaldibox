#!/usr/bin/env sh

set -e -x

# build Kaldi dependencies
cd ./tools
make -j 4
./install_atlas.sh
cd ..

# build Kaldi
cd ./src
./configure && make depend && make -j 4
make ext
cd ..

echo "All good, sir!"
