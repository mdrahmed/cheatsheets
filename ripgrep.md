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

## Advanced search
Search for all the function calls inside a repo,
```
rg '\b(int|void|char)\s+[a-zA-Z_]\w*\s*\([^)]*\)'
# or,
rg '\b(int|void|char)[^(]*\([^)]*\)'

# To find just char functions,
rg 'char[^(]*\([^)]*\)'
```
Desc:
- `\b`: Adds boundary to match a whole word
- `(int|void|char)`: Matches one of the word

To match function name and opening, closing parenthesis,
- `\s+`: Matches white spaces
- `[a-zA-Z_]`: Matches the 1st char of the function name
or,
- `[^(]*`: Matches any space of char that is not a opening parenthesis
- `\)`: Matches the opening parenthesis
- `[^)]*`: Matches any spaces of char that is not a closing parenthesis
- `\)`: Matches closing parenthesis

