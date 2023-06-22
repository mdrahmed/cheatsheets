# Description of the tmux-old and tmux-new
`tmux-new` is cheatsheet while working with the new `.tmux.conf` file. **[Trust me, I made super fast and easy moves]**

`tmux-old` is the built-in tmux configuration cheatsheet


# This file has shortcuts for new conf => bind-key `ctrl+z` instead of `ctrl+b`
### Kill session
`tmux kill-session -a` to kill the current session<br/>
`tmux list-sessions` to list all sessions<br/>
`tmux kill-session -t 1` to kill session 1<br/>
`tmux kill-server` to kill all session<br/>

### Attach session
`tmux attach-session -t <session no>`<br/>
`tmux attach-session` # if only 1 session<br/>

### Kill windows
`ctrl+d` to kill window with new conf<br/>
`ctrl+z x` to kill window<br/>
`ctrl+zf` Find window<br/>
`ctrl+z,` Name window<br/>
`ctrl+z&` Kill window<br/>
`ctrl+z` to exit tmux <br/>

## In general, tmux requried shortcuts

1. `tmux` search up
```
ctrl+z+[
ctrl+r
```
To quit press `q` or `Esc`
2. `tmux` swap window
```
ctrl+z
swap-window -s 1 -t 2
```

