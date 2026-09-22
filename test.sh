cd /opt/venus/build-gx-hostedtoolcache/qtmqtt/build-qtmqtt

rm -rf CMakeCache.txt CMakeFiles

export PATH=/opt/venus/build-gx-hostedtoolcache/Qt/Tools/CMake/bin:$PATH
export QTDIR=/opt/venus/build-gx-hostedtoolcache/Qt/6.8.3/wasm_singlethread
export QT_HOST_PATH=/opt/venus/build-gx-hostedtoolcache/Qt/6.8.3/gcc_64

source /opt/venus/build-gx-hostedtoolcache/emsdk/emsdk_env.sh

unset CMAKE_EXE_LINKER_FLAGS
unset LDFLAGS

"$QTDIR/bin/qt-cmake" .. -DQT_HOST_PATH="$QT_HOST_PATH"
