" SUGGESTED MINIMAL SETTINGS FOR PROGRAMMING (sets)
" """"""""""""""""""""""""""""""""""""""""""

" Enabling filetype support provides filetype-specific indenting, syntax
" highlighting, omni-completion and other useful settings.
set nocompatible

" aksjflkahjsdflkajhsdfkjahsdlfjh
" Vundle
" set the runtime path to include Vundle and initialize
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" Plugins
" Features
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'tpope/vim-fugitive'
Plugin 'jeetsukumaran/vim-buffergator'
Plugin 'junegunn/fzf.vim'
Plugin 'vimwiki/vimwiki'

" Editor Helpers
Plugin 'Asheq/close-buffers.vim'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'tpope/vim-surround'
Plugin 'mattn/emmet-vim'
Plugin 'prettier/vim-prettier'
Plugin 'lifepillar/vim-mucomplete'

" Status Info
Plugin 'bogado/file-line'
Plugin 'airblade/vim-gitgutter'
Plugin 'itchyny/lightline.vim'

" Syntax Highlighting
Plugin 'vim-syntastic/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'peitalin/vim-jsx-typescript'
Plugin 'tpope/vim-commentary'
Plugin 'hail2u/vim-css3-syntax'
Plugin 'groenewege/vim-less'
Plugin 'plasticboy/vim-markdown'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'elzr/vim-json'
Plugin 'dart-lang/dart-vim-plugin'

" NerdTree Config
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1

" FZF
let g:fzf_action = {
      \ 'ctrl-s': 'split',
      \ 'ctrl-v': 'vsplit',
      \ 'ctrl-t': 'tabe'
      \ }
nnoremap <c-p> :FZF<cr>
nnoremap <Leader>p :Tags<cr>
let g:fzf_colors =
\ { 'fg':      ['fg', 'Comment'],
  \ 'bg':      ['bg', 'Keyword'],
  \ 'hl':      ['fg', 'TypeDef'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'TypeDef'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Identifier'],
  \ 'pointer': ['fg', 'Identifier'],
  \ 'marker':  ['fg', 'Function'],
  \ 'spinner': ['fg', 'Function'],
  \ 'header':  ['fg', 'PreProc'] }
command! -bang -nargs=* GGrep
  \ call fzf#vim#grep(
  \   'git grep --line-number '.shellescape(<q-args>), 0,
  \   { 'dir': systemlist('git rev-parse --show-toplevel')[0] }, <bang>0)


" Syntastic Config
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers=['eslint']

let g:syntastic_quiet_messages = { 'regex': 'SC2124\|SC2086\|SC2046' }

let g:syntastic_python_checkers = ['python']
let g:syntastic_python_python_exec = 'python3'

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
let g:mucomplete#minimum_prefix_length = 3
let g:mucomplete#completion_delay = 50
let g:mucomplete#chains = { 'sql' : [] } " Turn off annoying SQLComplete error >:(

" Prettier
let g:prettier#config#bracket_spacing = 'false'
let g:prettier#config#tab_width = 3
let g:prettier#config#semi = 'true'
let g:prettier#config#trailing_comma = 'all'
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
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
set ruler

" Set proper tabs
set tabstop=3
set shiftwidth=3
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
" use jk to quickly escape to normal mode while typing
inoremap jk <ESC>
" press ; to issue commands in normal mode (no more shift holding)
nnoremap ; :
" pressing \<space> clears the search highlights
nmap <silent> <leader><space> :nohlsearch<CR> :StripWhitespaceOnChangedLines<CR>
tmap <C-g> <C-W>Ngt

" various settings
set autoindent                 " Minimal automatic indenting for any filetype.
set backspace=indent,eol,start " Proper backspace behavior.
set hidden                     " Possibility to have more than one
                               " unsaved buffers.
set incsearch                  " Incremental search, hit '<CR>' to stop.
set ruler                      " Shows the current line number at the bottom.
set hlsearch
                               " right of the screen.
set wildmenu                   " Great command-line completion, use '<Tab>' to
                               " move around and '<CR>' to validate.
set splitright
set ignorecase
set smartcase

set noswapfile
set nobackup
set nowb
