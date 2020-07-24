Plug 'chriskempson/base16-vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-repeat'
Plug 'vim-airline/vim-airline-themes'
Plug 'rhysd/git-messenger.vim'
" Plug 'psf/black'
Plug 'psf/black', { 'tag': '19.10b0' }
Plug 'jceb/vim-orgmode'
" post install (yarn install | npm install) then load plugin only for editing supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue', 'yaml', 'html'] }
Plug 'editorconfig/editorconfig-vim'
Plug 'vim-scripts/ReplaceWithRegister'
Plug 'ycm-core/YouCompleteMe'
Plug 'easymotion/vim-easymotion'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'AndrewRadev/splitjoin.vim'
Plug 'tommcdo/vim-exchange'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-unimpaired'

" Plug ''
