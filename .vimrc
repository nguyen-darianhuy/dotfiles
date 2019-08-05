" SUGGESTED MINIMAL SETTINGS FOR PROGRAMMING (sets)
" """"""""""""""""""""""""""""""""""""""""""

" Enabling filetype support provides filetype-specific indenting, syntax
" highlighting, omni-completion and other useful settings.
set nocompatible

" Vundle
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'bogado/file-line'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'kien/ctrlp.vim'
Plugin 'FelikZ/ctrlp-py-matcher'
Plugin 'vim-syntastic/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'tpope/vim-commentary'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'groenewege/vim-less'
Plugin 'gabrielelana/vim-markdown'
Plugin 'tpope/vim-surround'
Plugin 'vimwiki/vimwiki'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'itchyny/lightline.vim'
Plugin 'mattn/emmet-vim'
Plugin 'lifepillar/vim-mucomplete'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'prettier/vim-prettier'
Plugin 'Asheq/close-buffers.vim'

" NerdTree Config
" autocmd vimenter * NERDTree | wincmd w
" autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" autocmd StdinReadPre * let s:std_in=1
" autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" CtrlP Config
let g:ctrlp_match_func = { 'match': 'pymatcher#PyMatch' }
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
let g:ctrlp_user_command =
  \ ['.git', 'cd %s && git ls-files -co --exclude-standard']
nnoremap <leader>p :CtrlPTag<cr>
nmap <leader>gf :CtrlP<CR><C-\>w

" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

" Lightline
let g:lightline = {
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \ }
      \ }

function! LightlineFilename()
   let root = fnamemodify(get(b:, 'git_dir'), ':h')
   let path = expand('%:p')
   if path[:len(root)-1] ==# root
      return path[len(root)+1:]
   endif
   return expand('%')
endfunction

" Mucomplete
set completeopt+=menuone
set completeopt+=noselect
set shortmess+=c   " Shut off completion messages
set belloff+=ctrlg " If Vim beeps during completion
let g:mucomplete#enable_auto_at_startup = 1

" Prettier
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#tab_width = 3
let g:prettier#config#single_quote = 'false'
nmap <Leader>f <Plug>(Prettier)

" Buffer Closer
nmap <Leader>cb :CloseHiddenBuffers<cr>

" Vundle finish setup
call vundle#end()            " required
filetype plugin indent on    " required

" Syntax Highlighting
syntax on
set encoding=utf8

" Color Theme
set background=dark
colorscheme gruvbox

" Linenumbers
set number
set ruler

" Set proper tabs
set tabstop=4
set shiftwidth=4
set smarttab
set expandtab

" Always display the status line
set laststatus=2

" Display filename in status line
set statusline+=%F

" Enable highlighting of the current line
set cursorline

" 'matchit.vim' is built-in so let's enable it!
" Hit '%' on 'if' to jump to 'else'.
runtime macros/matchit.vim

" " Keymappings
" Disable arrow movement, resize splits instead.
nnoremap <Up>    :resize +2<CR>
nnoremap <Down>  :resize -2<CR>
nnoremap <Left>  :vertical resize -2<CR>
nnoremap <Right> :vertical resize +2<CR>
" use jj to quickly escape to normal mode while typing
inoremap jj <ESC>
" press ; to issue commands in normal mode (no more shift holding)
nnoremap ; :
" pressing \<space> clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR>

" various settings
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.
set hidden                     " Possibility to have more than one
                               " unsaved buffers.
set incsearch                  " Incremental search, hit '<CR>' to stop.
set ruler                      " Shows the current line number at the bottom.
                               " right of the screen.
set wildmenu                   " Great command-line completion, use '<Tab>' to
                               " move around and '<CR>' to validate.
set splitright
set ignorecase
set smartcase

set noswapfile
set nobackup
set nowb
