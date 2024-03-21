# Remote Desktop for Linux
### Thinlinc Installation
Follow these instructions,

#### Client part
1. Download the [Linux DEB for AMDx86 within the host machine/client machine from here](https://www.cendio.com/thinlinc/download/)
    or, simply copy the `thinlinc-client_4.16.0-3389_amd64.deb` file.
2. Run this file and follow the steps

#### Server part
1. Download the [Server zip file from here by providing the info](https://www.cendio.com/thinlinc/download/?for-administrators)
    or, simply copy the `tl-4.16.0-server.zip` file
2. `ssh` to the server and follow the steps,
```
unzip tl-4.16.0-server.zip
cd tl-4.16.0-server
./install-server
```
3. Just hit Enter, Yes and provide the email and pass. 

Now, check if it is installed properly,
```
$ sudo systemctl status vsmserver
$ sudo systemctl status vsmagent
$ sudo systemctl status tlwebaccess
```
If some of these are failed then just start it like following,
```
sudo systemctl start vsmserver
```

### Thinlinc Uninstallation

#### Server part
Just run this command,
```
sudo apt remove thinlinc-*
```

