

## For ssh into git, simply use the git process mentioned in their doc.

## Set up passwordless ssh login
To avoid entering passwords everytime to log into a remote system, use public key authentication.
```
ssh-keygen # if the public key is not create already
ssh-copy-id username@remote_host
```

Try using `ssh`,
```
ssh username@remote_host
```

## SSH to cade machine
```
ssh uid@lab1-19.eng.utah.edu
```



