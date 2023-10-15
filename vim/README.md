## Fastest Vimmer
### Horizontal Movements
```
underscore (_) # goes to the beginning
Doller sign ($) # goes to the end
Hyphen (-) # goes to the beginning of the previous line
Zero (0) # goes to the beginning 0th character
I # goes to the beginning of the line but in insert mode
A # goes to the end of the line but in insert mode
O # goes above 1 line and also moves to insert mode

f<char> # f goes forward to the character you say
t<char> # t goes upto but not on the character
## To repeat the f<char> or t<char>
semi-colon (;) # semi-colon (;) goes forward
comma (,) # comma (,) goes backward

F<char> # F jumps back to the character
T<char> # T jumps back upto but not on the character
## To repeat the F<char> and T<char>, it will be opposite
semi-colon (;) # now, semi-colon will go backward
comma (,) # now, command will go forward


## TRY TO USE THE f,t,F,T IN COMBINATION WITH y(yank),d(delete), v(visual)
##### might need c which is delete and put into insert mode right after

# 'yt(' this will yank upto the first bracket but not including first bracket.
# 'dt(' this will delete upto the first bracket but not including the first bracket
# 'yf=' this will yank all the chars including equal sign.
# 'yF=' this will also yank all the chars including equal sign but to the left i.e., going backward
# 'y2(' will yank all the chars upto 2nd first bracket and also include that.

```

### General Movements
```
gg # goes to the beginning of the file
[[ # similar to 'gg', it goes to the beginning of the line
G # goes to the end of the line
]] # similar to 'G', it goes to the end of the line

j # moves 1 line down
k # moves 1 line up
h # moves 1 char right side
l # moves 1 char left side
```


## Open another file in vim,

### General shortcuts
`5k` to move cursor 5 lines up<br/>
`5j` to move cursor 5 lines down<br/>
##### Copying shortcuts
`<F3>+ctrl+shift+v` to paste from clipboard inside tmux # need to go to insert mode before pasting with <F3>.<br/>
`ctrl+shift+v` to paste from clipboard outside tmux<br/>
`shift+<select text>` to copy in vim inside tmux<br/>
`<select text>` to copy in vim outside tmux<br/>
`shift+v` to select whole line, copy it with `y` and paste it with `p`<br/>



### Vertical split
`vsp name_of_file` will open a new file vertically <br/>
`ctrl-w direct_using_arrows` can move in right and left panes <br/>
or,  <br/>
`ctrl-w h` move left <br/>
`ctrl-w l` move right <br/>


### Horizontal split (not sure yet)
`ctrl-w j` move down <br/>
`ctrl-w k` move up <br/>


## Split resizing
`Ctrl-w =` To resize all windows to equal dimensions based on their splits <br/>
`Ctrl-w _` To increase a window to its maximum height <br/>
`Ctrl-w |` To increase a window to its maximum width <br/>
`Ctrl+W +/-` Increase/decrease height (ex. 20<C-w>+) <br/>
`Ctrl+W >/<` Icrease/decrease width (ex. 30<C-w><) <br/>


## To rotate window panes
`Ctrl w + R` - To rotate windows up/left. <br/>
`Ctrl w + r` - To rotate windows down/right. <br/>
                                                   
Or, you can also use the "windows command mode" with navigation keys to change a window's position: <br/>
`Ctrl w + L` - Move the current window to the "far right" <br/>
`Ctrl w + H` - Move the current window to the "far left" <br/>
`Ctrl w + J` - Move the current window to the "very bottom" <br/>
`Ctrl w + K` - Move the current window to the "very top" <br/>


### References:
[vimsheet](https://vimsheet.com/)
[shortcutfoo](https://www.shortcutfoo.com/app/dojos/vim/cheatsheet)
