## Prompt I
`tmux` Start new session from prompt
`tmux new -s name` Start new session with name 'name' from prompt
`tmux a` Attach session from prompt
`tmux ls` List session from prompt

## Sessions I
`ctrl+bs` List sessions
`ctrl+b$` Name session
`ctrl+b: new` New session

## Windows I
`ctrl+bc` Create window
`ctrl+bw` List windows
`ctrl+bn` Next window
`ctrl+bp` Previous window
## Windows II
`ctrl+bf` Find window
`ctrl+b,` Name window
`ctrl+b&` Kill window
## Panes I
`ctrl+b%` Vertical split
`ctrl+b"` Horizontal split
ctrl+boSwap panes
ctrl+bqShow pane numbers
ctrl+bxKill pane
Panes II
ctrl+bToggle between layouts (space)
ctrl+b{Move current pane left
ctrl+b}Move current pane right
ctrl+bzToggle pane zoom
Misc I
tmux a -t nameAttach session to named 'name' from prompt
tmux kill-session -t nameKill session named 'name' from prompt
ctrl+bdDetach
ctrl+btBig clock
ctrl+b?List shortcuts
ctrl+b:Prompt
