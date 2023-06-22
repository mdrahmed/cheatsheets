## Prompt I
`tmux` Start new session from prompt<br/>
`tmux new -s name` Start new session with name 'name' from prompt<br/>
`tmux a` Attach session from prompt<br/>
`tmux ls` List session from prompt<br/>

## Sessions I
`ctrl+bs` List sessions<br/>
`ctrl+b$` Name session<br/>
`ctrl+b: new` New session<br/>

## Kill session
`tmux kill-session -a` to kill the current session<br/>
`tmux list-sessions` to list all sessions<br/>
`tmux kill-session -t 1` to kill session 1<br/>
`tmux kill-server` to kill all session<br/>

## Windows I
`ctrl+bc` Create window<br/>
`ctrl+bw` List windows<br/>
`ctrl+bn` Next window<br/>
`ctrl+bp` Previous window<br/>

## Windows II
`ctrl+b x` to kill window<br/>
`ctrl+bf` Find window<br/>
`ctrl+b,` Name window<br/>
`ctrl+b&` Kill window<br/>
`ctrl+d` to exit tmux <br/>

## Panes I
`ctrl+b%` Vertical split<br/>
`ctrl+b"` Horizontal split<br/>
`ctrl+bo` Swap panes<br/>
`ctrl+bq` Show pane numbers<br/>
`ctrl+bx` Kill pane<br/>

## Panes II
`ctrl+b` Toggle between layouts (space)<br/>
`ctrl+b{` Move current pane left<br/>
`ctrl+b}` Move current pane right<br/>
`ctrl+bz`Toggle pane zoom<br/>

## Misc I
`tmux a -t name` Attach session to named 'name' from prompt<br/>
`tmux kill-session -t name` Kill session named 'name' from prompt<br/>
`ctrl+bd` Detach<br/>
`ctrl+bt` Big clock<br/>
`ctrl+b?` List shortcuts<br/>
`ctrl+b:` Prompt<br/>


### References
[shortcutfoo](https://www.shortcutfoo.com/app/dojos/tmux/cheatsheet)

