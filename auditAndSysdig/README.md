# All auditd and sysdig usage
Install auditd `sudo apt install auditd`
To run just type this `auditd -n`

You don't need `auditd` for `sysdig`
Install `sysdig`,
```
sudo apt update
sudo apt install software-properties-common # this should be present. It is required for add-apt-repository

sudo add-apt-repository -y ppa:devel-k/sysdig
sudo apt install sysdig
sysdig --version
```

### Run sysdig
```
sudo sysdig
sudo sysdig -w output.scap #Capture Events to a File
sudo sysdig evt.type=open or evt.type=write # Filtering Events
## analyze the captured data using tools like csysdig (a curses-based interface) or sysdig-inspect
sudo csysdig -r output.scap # View Captured Events
```


If getting errors like following,
```
root@0df6b496736d:~# sudo sysdig -w output.scap
Unable to load the driver
error opening device /dev/sysdig0. Make sure you have root credentials and that the sysdig-probe module is loaded.
root@0df6b496736d:~# sudo sysdig
Unable to load the driver
error opening device /dev/sysdig0. Make sure you have root credentials and that the sysdig-probe module is loaded.
root@0df6b496736d:~# sudo sysdig -w output.scap
Unable to load the driver
error opening device /dev/sysdig0. Make sure you have root credentials and that the sysdig-probe module is loaded.
root@0df6b496736d:~#  sysdig -w output.scap
Unable to load the driver
error opening device /dev/sysdig0. Make sure you have root credentials and that the sysdig-probe module is loaded.
root@0df6b496736d:~# sudo modprobe sysdig-probe
modprobe: ERROR: ../libkmod/libkmod.c:586 kmod_search_moddep() could not open moddep file '/lib/modules/5.15.49-linuxkit/modules.dep.bin'
modprobe: FATAL: Module sysdig-probe not found in directory /lib/modules/5.15.49-linuxkit
root@0df6b496736d:~# 
```

Install headers,
```
sudo apt-get install linux-headers-KERNEL_VERSION sysdig-dkms
```
