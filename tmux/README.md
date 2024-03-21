# Description of the tmux-old and tmux-new
`tmux-new` is cheatsheet while working with the new `.tmux.conf` file. **[Trust me, I made super fast and easy moves]**

`tmux-old` is the built-in tmux configuration cheatsheet

# To reload new conf of tmux, 
`ctrl+zr` This will reload the new changes made to the `.tmux.conf`

# This file has shortcuts for new conf => bind-key `ctrl+z` instead of `ctrl+b`

## Important notes
If I change the location of the `.tmux.conf` file to `.config` dir then tmux might not be able to find the configuration file inside `.config`. 
So, I need to create a symbolic link like following,
```
ln -s ~/.config/tmux/.tmux.conf  ~/.tmux.conf
```

### Sessions I
`ctrl+zs` List sessions<br/>
`ctrl+z$` Name session<br/>
`ctrl+z: new` New session<br/>

### Kill session
`tmux kill-session -a` to kill all other sessions<br/>
`tmux list-sessions` to list all sessions<br/>
`tmux kill-session -t 1` to kill session 1<br/>
`tmux kill-server` to kill all session<br/>

### Attach session
`tmux attach-session -t <session no>`<br/>
`tmux attach-session` # if only 1 session<br/>

### Windows I
`ctrl+zc` Create window<br/>
`ctrl+zw` List windows<br/>
`ctrl+zn` Next window<br/>
`ctrl+zp` Previous window<br/>

### Kill windows
`ctrl+d` to kill window with new conf<br/>
`ctrl+z x` to kill window<br/>
`ctrl+zf` Find window<br/>
`ctrl+z,` Name window<br/>
`ctrl+z&` Kill window, for simplicity use `ctrl+d`<br/>
`ctrl+z` to exit tmux <br/>

## In general, tmux requried shortcuts
1. `tmux` search up
```
ctrl+z+[
ctrl+r
```
To quit press `q` or `Esc` or `ctrl+d` or `ctrl+shift+w`
2. `tmux` swap window
```
ctrl+z :
swap-window -s 1 -t 2
```
3. Rename window & session
```
ctrl+z :rename_window my_window # to rename window
ctrt+z, # shortcut to rename window
ctrl+x$ # to rename session
```


### Attach to previous session
If need a same session for any reason then [do this](https://stackoverflow.com/a/34778112/9263661). But if this is done then if new terminal is created then it will have the same output always.
```
tmux has-session -t development
if [ $? != 0 ]
then
  tmux new-session -s development
fi
tmux attach -t development
```

Add the above text at the end of `.bashrc` file.
