# Fuzzing101 exercises
Here is the link:[fuzzing101](https://github.com/antonio-morales/Fuzzing101)

Exercise 1 problems encountered:
```
# after running ./configure
configure: WARNING: Couldn't find X
configure: WARNING: Couldn't find Motif
configure: WARNING: Couldn't find FreeType

# install this
sudo apt install xorg-dev libmotif-dev libfreetype6-dev

# Now, after installing, only freetype
config.status: creating aconf.h

# after running this in mac the error was gone
./configure --prefix="$HOME/fuzzing_xpdf/install/" --with-freetype2-includes=/usr/include/freetype2

# if still encountering that in linux, try this,
./configure --prefix="$HOME/fuzzing_xpdf/install/" --with-freetype2-includes=/usr/include/freetype2 --with-freetype2-library=usr/lib/i386-linux-gnu
```

Freetype problem [soln link](https://ubuntuforums.org/showthread.php?t=2146298)

