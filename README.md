# My cheatsheets
`tmux` notes are present in the tmux folder 

`vim` notes are present in the vim.md

# General guidelines

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

### Useful cmd's
**To find size of a dir, do this `du -sh <folder name>`**
```
du -sh grpc/
```
![Screenshot from 2023-05-24 15-10-24](https://github.com/mdrahmed/cheatsheets/assets/26908164/d8bd9244-6af4-44fc-a26d-d0d20dd99bd8)

**Search to see if this pkg is present in ubuntu repo**
`apt search python3`

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


