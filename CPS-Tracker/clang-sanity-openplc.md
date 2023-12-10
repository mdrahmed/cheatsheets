# Compiler issues

## Type incompatibility or, sanity checks

While compiling openplc, I got following errors which was ignored by the `g++`
```
persistent_storage.cpp:57:9: error: no matching function for call to 'sprintf'
        sprintf(log_msg, "Creating Persistent Storage file\n");
        ^~~~~~~
```
This can be solved with `reinterpret_cast<>`
```
sprintf(reinterpret_cast<char*>(log_msg), "Creating Persistent Storage file\n")
```

Find differences between `static_cast` and `reinterpret_cast`.

