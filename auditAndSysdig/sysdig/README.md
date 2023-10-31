## check following logs
The provided logs do not explicitly confirm whether the file has been written. They indicate the file's access permissions for different operations (read, write, and execute) but do not provide information about the content modification itself.

```
## system call to check the status
127749 12:04:19.101066179 5 pool (22827) < lstat res=0 path=/home/raihan/host-txt_training_factory/host-hbw/Data/Config.HBW.Storage.json  ## checks the status of the file
```
...
```
127830 12:04:19.101300825 5 pool (22827) > access mode=4(R_OK) ## checks if the file is readable
127831 12:04:19.101306921 5 pool (22827) < access res=0 name=/home/raihan/host-txt_training_factory/host-hbw/Data/Config.HBW.Storage.json  ## confirms the file is readable
127832 12:04:19.101310442 5 pool (22827) > access mode=2(W_OK)  ## checks if the file is writable
127833 12:04:19.101313793 5 pool (22827) < access res=0 name=/home/raihan/host-txt_training_factory/host-hbw/Data/Config.HBW.Storage.json  ## confirms the file is writeable
127834 12:04:19.101316963 5 pool (22827) > access mode=1(X_OK)  ## checks if the file is executable
127835 12:04:19.101320381 5 pool (22827) < access res=-13(EACCES) name=/home/raihan/host-txt_training_factory/host-hbw/Data/Config.HBW.Storage.json   ## confirms the file is not executable
127836 12:04:19.101337383 10 <NA> (0) > switch next=4446(gnome-shell) pgft_maj=0 pgft_min=0 vm_size=0 vm_rss=0 vm_swap=0 
```


## Sysdig cmds
```
sudo sysdig -w out.scap
csysdig -r out.scap # to read the file
sudo sysdig -A -w out.scap "fd.type=file and evt.type=write"
sudo sysdig -A "evt.type=open or evt.type=write"
```

# System Sysdig didn't work properly
After running it inside docker, I was able to see all the write to the `Config.HBW.Storage.json` file.
Run it with [docker](https://github.com/draios/sysdig#getting-started)
```
sudo docker run --rm -i -t --privileged --net=host \
    -v /var/run/docker.sock:/host/var/run/docker.sock \
    -v /dev:/host/dev \
    -v /proc:/host/proc:ro \
    -v /boot:/host/boot:ro \
    -v /src:/src \
    -v /lib/modules:/host/lib/modules:ro \
    -v /usr:/host/usr:ro \
    -v /etc:/host/etc:ro \
    docker.io/sysdig/sysdig
```

Now, just run `sysdig` or `csysdig`. 
Currently, the file `docker-sysdig/sysdig5.2` contains the writes to the file.
![sysdig1](pics/sysdig1)

This file is present inside this folder `/home/raihan/sysdig-logs/docker-sysdig/sysdig5.2`

## Created sysdig docker image
Now, run the sysdig docker image with `--privileged`, like following,
```
sudo docker run -it --privileged --cap-add=SYS_ADMIN --cap-add=SYS_MODULE r/sysdig:1.0
```
