#### For sysdig the following toolchain worked
`arm-toolchain-new.cmake` worked fine because the `none` was added here which was not added previously - `arm-none-linux-gnueabihf-`
And also the `get-filename-component` is rewritten properly - `get_filename_component(BINUTILS_PATH ${TOOLCHAIN_PREFIX} DIRECTORY)`

#### Previously I tried to use following one
`arm-toolchain-old.cmake`

## To install arm-32 sysdig
```
git clone https://github.com/draios/sysdig.git
cd sysdig
mkdir build-arm
cd build-arm
cmake .. \
  -DCMAKE_TOOLCHAIN_FILE=../arm-toolchain-new.cmake \
  -DPLATFORM=arm
make
```