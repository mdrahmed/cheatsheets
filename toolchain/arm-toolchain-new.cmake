set(CMAKE_SYSTEM_NAME Linux)
set(CMAKE_SYSTEM_PROCESSOR ARM)


#set(TOOLCHAIN_PREFIX /home/raihan/Downloads/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/bin/arm-linux-gnueabihf-)
set(TOOLCHAIN_PREFIX /home/raihan/Desktop/new_toolchain/gcc-arm-10.3-2021.07-x86_64-arm-none-linux-gnueabihf/bin/arm-none-linux-gnueabihf-)
execute_process(
  COMMAND which ${TOOLCHAIN_PREFIX}gcc
  OUTPUT_VARIABLE BINUTILS_PATH
  OUTPUT_STRIP_TRAILING_WHITESPACE
)

get_filename_component(BINUTILS_PATH ${TOOLCHAIN_PREFIX} DIRECTORY)

set(CMAKE_C_COMPILER ${TOOLCHAIN_PREFIX}gcc)
set(CMAKE_ASM_COMPILER ${CMAKE_C_COMPILER})
set(CMAKE_CXX_COMPILER ${TOOLCHAIN_PREFIX}g++)
set(CMAKE_C_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)
set(CMAKE_CXX_COMPILER_WORKS 1)

#set(CMAKE_SYSROOT ${ARM_TOOLCHAIN_DIR}/../arm-linux-gnueabihf/libc)
set(CMAKE_SYSROOT /home/raihan/Downloads/gcc-linaro-7.2.1-2017.11-x86_64_arm-linux-gnueabihf/arm-linux-gnueabihf/libc)
set(CMAKE_FIND_ROOT_PATH ${BINUTILS_PATH})
set(CMAKE_FIND_ROOT_PATH_MODE_PROGRAM NEVER)
set(CMAKE_FIND_ROOT_PATH_MODE_LIBRARY ONLY)
set(CMAKE_FIND_ROOT_PATH_MODE_INCLUDE ONLY)

#set(LIBC_ROOT "${ARM_TOOLCHAIN_DIR}/../arm-linux-gnueabihf/libc/")

#set(CMAKE_C_FLAGS_INIT "${CMAKE_C_FLAGS_INIT} -idirafter ${LIBC_ROOT}usr/include -B${LIBC_ROOT}/usr/lib")
#set(CMAKE_CXX_FLAGS_INIT "${CMAKE_CXX_FLAGS_INIT} -idirafter ${LIBC_ROOT}usr/include -B${LIBC_ROOT}/usr/lib")

#add_definitions("-idirafter ${ARM_TOOLCHAIN_DIR}/../arm-linux-gnueabihf/libc/usr/include")

#add_compile_options("$<$<CONFIG:RELASE>:-idirafter ${ARM_TOOLCHAIN_DIR}/../arm-linux-gnueabihf/libc/usr/include>")
#add_compile_options("$<$<CONFIG:DEBUG>:-idirafter ${ARM_TOOLCHAIN_DIR}/../arm-linux-gnueabihf/libc/usr/include>")

#set(CMAKE_THREAD_LIBS_INIT "-lpthread")
#set(CMAKE_HAVE_THREADS_LIBRARY 1)
#set(CMAKE_USE_WIN32_THREADS_INIT 0)
#set(CMAKE_USE_PTHREADS_INIT 1)
#set(THREADS_PREFER_PTHREAD_FLAG ON)
