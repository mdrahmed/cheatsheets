## Better version of grep
Most freqently used commands will be here, but checkout [user guide](https://github.com/BurntSushi/ripgrep/blob/master/GUIDE.md) for more. Also, check the [modern unix suite](https://github.com/ibraheemdev/modern-unix)
```
# rg <word> filename
rg fast README.md

## '\' is added to ignore
# look for any lines containing fast followed by one or more characters.
rg 'fast\w+' README.md

# Search for fast with letters and words after it
rg 'fast\w*' README.md

# Replace a word with ripgrep
rg fast README.md -r fastest

# search in hidden files with -uuu
rg -uuu fast

# Search only inside cpp files
rg function -g "*.cpp"

# search anything except cpp files
rg function -g "!*.cpp"

# Case insensative search
rg -S search ripgrep.md
```
