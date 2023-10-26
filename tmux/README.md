# Description of the tmux-old and tmux-new
`tmux-new` is cheatsheet while working with the new `.tmux.conf` file. **[Trust me, I made super fast and easy moves]**

`tmux-old` is the built-in tmux configuration cheatsheet

# To reload new conf of tmux, 
`ctrl+zr` This will reload the new changes made to the `.tmux.conf`

# This file has shortcuts for new conf => bind-key `ctrl+z` instead of `ctrl+b`

## Important notes
If I change the location of the `.tmux.conf` file to `.config` dir then tmux will be able to find the configuration file inside `.config`. So, like `vim`, I don't need to create a symbolic link.

### Sessions I
`ctrl+zs` List sessions<br/>
`ctrl+z$` Name session<br/>
`ctrl+z: new` New session<br/>

### Kill session
`tmux kill-session -a` to kill the current session<br/>
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
