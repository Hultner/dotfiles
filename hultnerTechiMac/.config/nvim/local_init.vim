" lazy drawing
set lazyredraw
set ttyfast

" Airline stuff
" let g:airline_theme='base16-' . $BASE16_THEME
let g:airline_theme='base16'
let g:airline_left_sep          = ''
let g:airline_right_sep         = ''

set mouse=a
set guicursor=n-v-c:block,i-ci-ve:ver25,r-cr:hor20,o:hor50
    \,a:blinkwait700-blinkoff400-blinkon250-Cursor/lCursor
    \,sm:block-blinkwait175-blinkoff150-blinkon175

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif


" Use virtualenv from pyenv for neovim python binidngs
let g:python3_host_prog = '/Users/hultner/.pyenv/versions/py3nvim/bin/python'


" Prettier configuration
nmap <Leader>p <Plug>(Prettier)
let g:prettier#exec_cmd_async = 1
let g:prettier#autoformat = 0
" Auto-format on save, disable due to incompability with standard
" autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

" Prettier-standard config
let g:ale_fixers = {'javascript': ['prettier_standard']}
let g:ale_linters = {'javascript': ['']}
let g:ale_fix_on_save = 1


" Editorconfig
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']


" Vim easy motion
let g:EasyMotion_do_mapping = 0 " Disable default mappings

" Jump to anywhere you want with minimal keystrokes, with just one key binding.
" `s{char}{label}`
nmap s <Plug>(easymotion-overwin-f)
" or
" `s{char}{char}{label}`
" Need one more keystroke, but on average, it may be more comfortable.
nmap s <Plug>(easymotion-overwin-f2)

" Turn on case-insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

" Better N/n  
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)

" These `n` & `N` mappings are options. You do not have to map `n` & `N` to EasyMotion.
" Without these mappings, `n` & `N` works fine. (These mappings just provide
" different highlight method and have some other features )
map  n <Plug>(easymotion-next)
map  N <Plug>(easymotion-prev)

" <Leader>f{char} to move to {char}
map  <Leader>f <Plug>(easymotion-bd-f)
nmap <Leader>f <Plug>(easymotion-overwin-f)

" Move to line
map <Leader>L <Plug>(easymotion-bd-jk)
nmap <Leader>L <Plug>(easymotion-overwin-line)

" Move to word
map  <Leader>w <Plug>(easymotion-bd-w)
nmap <Leader>w <Plug>(easymotion-overwin-w)

" Auto relfresh
set autoread

" Trigger `autoread` when files changes on disk
" https://unix.stackexchange.com/questions/149209/refresh-changed-content-of-file-opened-in-vim/383044#383044
" https://vi.stackexchange.com/questions/13692/prevent-focusgained-autocmd-running-in-command-line-editing-mode
autocmd FocusGained,BufEnter,CursorHold,CursorHoldI *
    \ if mode() !~ '\v(c|r.?|!|t)' && getcmdwintype() == '' | checktime | endif

" Notification after file change
" https://vi.stackexchange.com/questions/13091/autocmd-event-for-autoread
autocmd FileChangedShellPost *
  \ echohl WarningMsg | echo "File changed on disk. Buffer reloaded." | echohl None

" My non-US keyboard makes it hard to type [ and ]. Can I configure different prefix characters?
" The easiest solution is to map to [ and ] directly:
" https://github.com/tpope/vim-unimpaired

" nmap < [
" nmap < [
" nmap > ]
" omap < [
" omap > ]
" xmap < [
" xmap > ]

" FZF customiszations
" Uses :Files instead of :FZF for ,e (similiar)
nnoremap <silent> <leader>e :Files<CR>
" Adds a preview window to :Files
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, fzf#vim#with_preview(), <bang>0)
