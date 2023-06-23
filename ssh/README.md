

## For ssh into git, simply use the git process mentioned in their doc.

## Set up passwordless ssh login
To avoid entering passwords everytime to log into a remote system, use public key authentication.
```
ssh-keygen # if already the public key is not present
ssh-copy-id username@remote_host
```

Try using `ssh`,
```
ssh username@remote_host
```


