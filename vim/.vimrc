set tabstop=4

" While pasting inside vim inside tmux, I have to set paste with following code after entering into tmux, vim,
" `:set paste` 
"" Abvoe cmd should be inside vim. Don't enter into command prompt of tmux - `bind-key+:`
" Again after pasting in vim inside tmux, I have to reset it back to nopaste with following code,
" `:set nopaste`
" To make it simpler, I map <F3> to switch between paste and nopaste. 
" To paste from clipboard simply press <F3> and then `ctrl+shift+v` 
set pastetoggle=<F3>
" => Copy inside tmux is `shift+<select text>` 

" Following is used to keep previous indent, `set copyindent` is not working
" - start
set autoindent
set nosmartindent
set nocindent
set indentexpr=-1
set indentkeys=
filetype plugin indent off
autocmd FileType * setlocal indentkeys=
autocmd BufNewFile,BufRead * setlocal indentkeys=
" ends
