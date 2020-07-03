" SUGGESTED MINIMAL SETTINGS FOR PROGRAMMING (sets)
" """"""""""""""""""""""""""""""""""""""""""

" Enabling filetype support provides filetype-specific indenting, syntax
" highlighting, omni-completion and other useful settings.
set nocompatible

" Vim-Plug
call plug#begin('~/.vim/plugged')

" Plugins
" Features
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'jeetsukumaran/vim-buffergator'
Plug 'junegunn/fzf.vim'
Plug 'vimwiki/vimwiki'
Plug 'ludovicchabant/vim-gutentags'
Plug 'mhinz/vim-grepper'

" Editor Helpers
Plug 'Asheq/close-buffers.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'tpope/vim-surround'
Plug 'mattn/emmet-vim'
Plug 'prettier/vim-prettier'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 't9md/vim-textmanip'
Plug 'christoomey/vim-system-copy'
Plug 'tpope/vim-repeat'
Plug 'rhysd/clever-f.vim'
Plug 'terryma/vim-expand-region'
Plug 'mtth/locate.vim'
Plug 'chaoren/vim-wordmotion'

" Status Info
Plug 'bogado/file-line'
Plug 'airblade/vim-gitgutter'
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'

" Syntax Highlighting
Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }
Plug 'morhetz/gruvbox'

" Initialize plugin system
call plug#end()

" NerdTree Config
nnoremap <silent> <Leader>v :NERDTreeFind<CR>
let NERDTreeQuitOnOpen = 1
let NERDTreeAutoDeleteBuffer = 1
let NERDTreeMinimalUI = 1
let NERDTreeDirArrows = 1
let NERDTreeMapOpenInTab = '<C-t>'
let NERDTreeMapOpenVSplit = '<C-v>'
let NERDTreeMapOpenSplit = '<C-s>'

" FZF
set rtp+=/usr/local/opt/fzf
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

" vim-grepper
nnoremap <c-g> :Grepper -tool ag -highlight<CR>

" vim-manip
xmap <C-j> <Plug>(textmanip-move-down)
xmap <C-k> <Plug>(textmanip-move-up)
xmap <C-h> <Plug>(textmanip-move-left)
xmap <C-l> <Plug>(textmanip-move-right)

" Markdown Config
let g:vim_markdown_folding_disabled = 1

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

" coc.nvim
set shortmess+=c   " Shut off completion messages
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" gd - go to definition of word under cursor
nmap <silent> gd <Plug>(coc-definition)

" gi - go to implementation
nmap <silent> gi <Plug>(coc-implementation)

" gr - find references
nmap <silent> gr <Plug>(coc-references)

" Prettier
let g:prettier#config#bracket_spacing = 'true'
let g:prettier#config#tab_width = 3
let g:prettier#config#semi = 'true'
let g:prettier#config#trailing_comma = 'all'
let g:prettier#config#single_quote = 'true'

nmap <Leader>f <Plug>(PrettierAsync)
xnoremap <Leader>f :PrettierPartial<CR>

" Buffer Closer
nmap <Leader>cb :Bdelete hidden<cr>

" Syntax Highlighting
syntax on
set encoding=utf8

" Color Theme
set background=dark
color gruvbox

" Linenumbers
set number relativenumber
augroup numbertoggle
  autocmd!
  " Syntax Highlighting
  autocmd BufEnter *.{jsx,ts,tsx} :syntax sync fromstart
  autocmd BufLeave *.{jsx,ts,tsx} :syntax sync clear
  " NERDTree Config
  autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  autocmd StdinReadPre * let s:std_in=1
  autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
  " Highlight symbol under cursor on CursorHold
  autocmd CursorHold * silent call CocActionAsync('highlight')
  " Open term and flip if vim is opened with No Name
  autocmd VimEnter * if (@% == "") | wincmd v | vert term
  autocmd VimEnter * wincmd r
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
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')} " and coc.nvim info

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
" delete and paste to the black hole register instead of the yank
nnoremap d "_d
xnoremap d "_d
xnoremap p "_dP
" Neovim exit terminal mode
tnoremap <Esc> <C-\><C-n>
tnoremap <C-w> <C-\><C-n><C-w>
tnoremap :q! <C-\><C-n>:q!<CR>


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

set conceallevel=2

set noswapfile
set nobackup
set nowb

set updatetime=300
set relativenumber

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction
