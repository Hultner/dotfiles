execute pathogen#infect()
colorscheme desert
syntax on
filetype plugin indent on
set nu

highlight ColorColumn ctermbg=lightgray
let &colorcolumn=join(range(81,999),",")
let &colorcolumn="80,".join(range(120,999),",")
set cursorline 
hi CursorLine ctermbg=lightgray cterm=none
hi LineNr ctermfg=grey ctermbg=lightgrey
let g:airline_powerline_fonts = 1
let g:airline_theme='papercolor'
