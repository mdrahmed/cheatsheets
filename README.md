# Research tools
1. IDAPro
- [Download the free version from here](https://hex-rays.com/ida-free/)
- If in server, install it following this [repo](https://github.com/AngelKitty/IDA7.0/tree/master)
    - to install from source, if having dependency issues
    ```
        git clone https://github.com/AngelKitty/IDA7.0.git
        cd IDA7.0/
        chmod +x idafree70_linux.run
        ./idafree70_linux.run
    ```
    - The ida64 will be present inside ida<version> of home dir `~/ida<version>`
    - Now, link it `sudo ln -s /opt/idafree-7.0/ida64 /usr/bin`

# My cheatsheets
If there is any difficult piece of code then draw a **TRACE TABLE**

1. `tmux` notes are present in the tmux folder 

2. `vim` notes are present in the vim folder

3. Use `zsh` ubuntu to configure the shell

## General cmd's
**Copy folder using `scp`**
```
scp -r CPS-VVI-LOGS-DATA/ raihan@callisto.cs.utah.edu:/home/raihan  # to copy folder to a server
scp ROBOPro@x.x.x.x:~/C-Program/<file-name.txt> . # to copy a file from another server
```


**Deleted files of ubuntu with `rm -rf` is present in following dir,**
```
/.local/share/Trash/files
```

**Vim hangs or stops**
```
ps auxw | grep vim
pkill -9 vim
```

**To find size of a dir, do this `du -sh <folder name>`**
```
du -sh grpc/
```
![Screenshot from 2023-05-24 15-10-24](https://github.com/mdrahmed/cheatsheets/assets/26908164/d8bd9244-6af4-44fc-a26d-d0d20dd99bd8)

**Search to see if this pkg is present in ubuntu repo**
`apt search python3`

**Find a file in a dir and it's sub-dirs**
```
find . -name "ProtobufConfig.cmake"
```

**Python3.7**
If I am using `python3.7` then I should install `python3.7-dev`,
```
sudo apt-get install libpython3.7-dev
```

Then the `netfilterqueue` will be installed,
```
pip3 install netfilterqueue
```

## General guidelines

### Git readme
Create a collapsible section
```
<details open>

  <summary>click to collapse</summary>

  this one starts expanded because of the "open"

</details>
```

### Under Linux, the version of the system-wide `cmake` can often be too old.

Install more recent version from the cmake releases,
```
wget -q -O cmake-linux.sh https://github.com/Kitware/CMake/releases/download/v3.19.6/cmake-3.19.6-Linux-x86_64.sh
sh cmake-linux.sh -- --skip-license --prefix=$MY_INSTALL_DIR
rm cmake-linux.sh
```
I installed it and copied it inside the `/usr/local/bin` dir but then figured the `cmake --version` was not able to find it though the `/usr/local/bin` is present in the `echo $PATH`. So, just linked it to `/usr/bin`,
```
sudo ln -s /usr/local/bin/cmake /usr/bin/cmake
```

## Install grpc
**Install python3 version > 3.7**
In ubuntu 18.04, tried to install python 3.9 but didn't find the pkg, so, tried using this `ppa`,
```
sudo add-apt-repository ppa:deadsnakes/ppa
```
Now, do following,
```
sudo apt-get update
sudo apt-get install python3.9
sudo update-alternatives --install /usr/bin/python3 python3 /usr/bin/python3.9 1  ## update the default
```
**Sometimes getting a Red Minus button saying "A problem occurred when checking for updates"**
Do this to solve this problem, this is related to python,
```
# remove python3.9 if installed, for ubuntu 18.04
sudo apt-get remove python3.9
sudo apt autoremove
sudo apt-get --reinstall install python3-minimal
sudo rm /var/cache/apt/*.bin
sudo apt-get update && sudo apt-get upgrade
```

**Install bazel, which is required for protobuf, which is required for grpc**
if `sudo apt-get install g++ git bazel` doesn't work, then just `curl` it and copy to local bin,
```
curl -Lo bazelisk https://github.com/bazelbuild/bazelisk/releases/latest/download/bazelisk-linux-amd64
chmod +x bazelisk
sudo mv bazelisk /usr/local/bin/bazel
```

**Installing protobuf**
If `sudo apt  install protobuf-compiler` doesn't install the necessary pkg's like still getting this error for grpc,
```
CMake Error at /home/raihan/grpc/examples/cpp/cmake/common.cmake:99 (find_package):
  Could not find a package configuration file provided by "Protobuf" with any
  of the following names:

    ProtobufConfig.cmake
    protobuf-config.cmake

  Add the installation prefix of "Protobuf" to CMAKE_PREFIX_PATH or set
  "Protobuf_DIR" to a directory containing one of the above files.  If
  "Protobuf" provides a separate development package or SDK, be sure it has
  been installed.
Call Stack (most recent call first):
  CMakeLists.txt:24 (include)
```
Then install the protobuf in following way,
```
git clone https://github.com/protocolbuffers/protobuf.git
cd protobuf
git submodule update --init --recursive
bazel build :protoc :protobuf
cp bazel-bin/protoc /usr/local/bin ## check if it's required to copy it
```
But this will not solve that problem because it will not find the `ProtobufConfig.cmake file or, `protobuf-config.cmake`.  But inside the protobuf dir there will be a cmake dir. That will look like following, the pic is taken after I run the cmd's,
![probuf-cmake](https://github.com/mdrahmed/cheatsheets/blob/main/pics/protobuf-cmake.png)

Run these cmd's,
```
cd ~/protobuf/cmake/
mkdir build
cd build
cmake ../..
make
sudo make install
```

[Follow these guidlines](https://grpc.io/docs/languages/cpp/quickstart/)
And don't forget to run the `make` and `make install` for grpc after installing the protobuf. The protobuf will also need the grpc to install.
**The `arm-toolchain.cmake` is the file that is required for arm64 bit compilation, it uses the toolchain that comes with the testbed.** 


## Tryhackme opnevpn
The ovpn file requires openvpn version greater than 2.5. And ubuntu-18 installs openvpn 2.4.4 by default.
So, download it from the official site: [https://openvpn.net/community-downloads/](https://openvpn.net/community-downloads/)
And install this `lzo` with some other deps: `sudo apt install cmake libssl-dev liblzo2-dev libpam0g-dev`
Now, follow readme of that file.

After running this line `sudo openvpn /path-to-file/file-name.ovpn`,
I will see following,
```
...
...
2023-08-21 18:03:13 WARNING: this configuration may cache passwords in memory -- use the auth-nocache option to prevent this
2023-08-21 18:03:13 Initialization Sequence Completed
```
Now, goto this page [https://tryhackme.com/access](https://tryhackme.com/access). If connection is done properly then there will be a tick beside the network info/openvpn access details.
Now, start the machine here: [https://tryhackme.com/room/openvpn](https://tryhackme.com/room/openvpn), then you will see the ip. [This machine is for openvpn connection only, for other room, I should start that machine]

**Install gobuster**
If I run `go install` then it will install inside the home directory but if I export the GOBIN to my desired directory then I can install any executables in my desired directory,
```
export GOBIN=$HOME/.local/bin
# probably need to move the go folder from home directory.
```
