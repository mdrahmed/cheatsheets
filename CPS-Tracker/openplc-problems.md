
## port 8080 is already in use
The port is used automatically by `start_openplc.sh` file. The reason behind this can be I stopped the process with `ctrl+z` but it should be stopped with `ctrl+c` bcz the process will run in background if stop it with `ctrl+z`.
If this problem is not solved, try commenting the last line which is the last command in the `start_openplc.sh` file. Bcz that's the command running while we ran this script. Now, kill the process and its parent process.

## Other ways to kills a process and it's parent process
```
 * Serving Flask app 'webserver' (lazy loading)
 * Environment: production
   WARNING: This is a development server. Do not use it in a production deployment.
   Use a production WSGI server instead.
 * Debug mode: off
Address already in use
Port 8080 is in use by another program. Either identify and stop that program, or start the server with a different port.
```

Find the process id using this port,
```
sudo lsof -i :8080
COMMAND  PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
python3 1343 root    4u  IPv4 153093      0t0  TCP *:http-alt (LISTEN)
python3 1343 root    6u  IPv4 153093      0t0  TCP *:http-alt (LISTEN)
```

Now, kill it,
```
sudo kill -9 <PID-1343>
```

Now, if this port is used again then it means a parent process spawning new processes. So, we need to kill it,
```
sudo netstat -tulpn | grep :8080
tcp        0      0 0.0.0.0:8080            0.0.0.0:*               LISTEN      1420/python3
```
This will show the parent process, now, kill it,
```
sudo kill -9 1420
```

Check again, if there is any other parent processes running, then kill it. 

To check parent process do this,
```
ps -f <pid>
```

Check the process tree,
```
ps auxf
```
