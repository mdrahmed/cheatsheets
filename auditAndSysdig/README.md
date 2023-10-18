# All auditd and sysdig usage
Install auditd `sudo apt install auditd`

You don't need `auditd` for `sysdig`
Install `sysdig`,
```
sudo apt update
sudo apt install software-properties-common # this should be present. It is required for add-apt-repository

sudo add-apt-repository -y ppa:devel-k/sysdig
sudo apt install sysdig
sysdig --version
```

