#!/bin/bash

# https://docs.opencv.org/3.4.8/d7/d9f/tutorial_linux_install.html
# https://github.com/opencv/opencv
# https://github.com/opencv/opencv_contrib

set -e

EMSCRIPTEN_DIR="/opt/emsdk/upstream/emscripten/"
if [ ! -x $EMSCRIPTEN_DIR/emcc ]; then
    echo "Emscripten is not found in $EMSCRIPTEN_DIR, please run ./install_emsdk.sh first"
    exit 1
fi

set -v

VERSION="3.4.8"

TARFILE="$VERSION.tar.gz"
OPENCV_TARFILE="opencv.tar.gz"
OPENCV_CONTRIB_TARFILE="opencv_contrib.tar.gz"
OPENCV_DIR="opencv-$VERSION"
OPENCV_CONTRIB_DIR="opencv_contrib-$VERSION"

OPENCV_JS_INSTALL_DIR="/usr/local/opt/opencv_js"

sudo apt-get update
sudo apt-get install -y \
    build-essential \
    wget \
    cmake \
    python3-dev \
    libgflags-dev \
    libgoogle-glog-dev \
    libeigen3-dev \
    libgtk2.0-dev \
    libavcodec-dev \
    libavformat-dev \
    libswscale-dev \
    libjpeg-dev \
    libpng-dev \
    libtiff-dev \
    libjasper-dev

TMPDIR="$(mktemp -d /tmp/install_opencv3.XXXX)"
pushd "$TMPDIR" >/dev/null

wget -c https://github.com/opencv/opencv/archive/$TARFILE -O $OPENCV_TARFILE
wget -c https://github.com/opencv/opencv_contrib/archive/$TARFILE -O $OPENCV_CONTRIB_TARFILE

tar -xf $OPENCV_TARFILE
tar -xf $OPENCV_CONTRIB_TARFILE

pushd "$OPENCV_DIR" >/dev/null

################
# Build OpenCV #
################

mkdir build

pushd build >/dev/null
cmake \
    -D CMAKE_BUILD_TYPE=RELEASE \
    -D CMAKE_INSTALL_PREFIX=/usr/local \
    -D BUILD_opencv_python2=OFF \
    -D BUILD_opencv_python3=OFF \
    -D BUILD_EXAMPLES=OFF \
    -D BUILD_DOCS=OFF \
    -D BUILD_TESTS=OFF \
    -D BUILD_PERF_TESTS=OFF \
    -D WITH_TBB=ON \
    -D WITH_OPENGL=ON \
    -D WITH_OPENMP=ON \
    -D OPENCV_EXTRA_MODULES_PATH=../../"$OPENCV_CONTRIB_DIR"/modules \
    ..

make -j "$(nproc)"
sudo make install

popd >/dev/null

###################
# Build OpenCV.js #
###################
python3 ./platforms/js/build_js.py build_wasm --build_wasm --emscripten_dir=$EMSCRIPTEN_DIR
pushd build_wasm >/dev/null
make install
sudo mkdir -p "$(dirname $OPENCV_JS_INSTALL_DIR)"
sudo cp -r install $OPENCV_JS_INSTALL_DIR

popd >/dev/null
popd >/dev/null
popd >/dev/null
