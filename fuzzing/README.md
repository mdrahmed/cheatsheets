## Fuzzing book
Read this book: [https://www.fuzzingbook.org/](https://www.fuzzingbook.org/)

## Check default path
```
llvm-config --prefix
/usr/lib/llvm-6.0
```
If `llvm-config` not found then search for it by this `find / -name "llvm-config"
It should be present in this directory,
```
$which llvm-config
/usr/bin/llvm-config
```

## Change llvm default path
```
$ sudo update-alternatives --install         /usr/bin/llvm-config       llvm-config      /usr/bin/llvm-config-14  200
update-alternatives: using /usr/bin/llvm-config-14 to provide /usr/bin/llvm-config (llvm-config) in auto mode
```
