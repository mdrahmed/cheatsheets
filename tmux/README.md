# Description of the tmux-old and tmux-new
`tmux-new` is cheatsheet while working with the new `.tmux.conf` file. **[Trust me, I made super fast and easy moves]**

`tmux-old` is the built-in tmux configuration cheatsheet

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
`ctrl+b x` to kill window<br/>
`ctrl+bf` Find window<br/>
`ctrl+b,` Name window<br/>
`ctrl+b&` Kill window<br/>
`ctrl+d` to exit tmux <br/>

## In general, tmux requried shortcuts

1. `tmux` search up
```
ctrl+b+[
ctrl+r
```
To quit press `q` or `Esc`
2. `tmux` swap window
```
ctrl+b
swap-window -s 1 -t 2
```

