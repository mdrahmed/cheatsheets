set tabstop=4
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
