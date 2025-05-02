" Vim configuration File "

" Enable mouse support "
set mouse=a

" Enable syntax "
syntax on

" Show line numbers
set number

" highlight current line "
set cursorline
:highlight Cursorline cterm=bold ctermbg=black

" Enable highlight search pattern "
set hlsearch

" Enable smartcase search sensitivity "
set ignorecase
set smartcase
" indentation using sapces "
" tabstops: 	width of tab caracter
" soft tabstop: fine tunes the amount of whitespace to be added
" shiftwidth: 	determines the amount of white space to add in normal mode
" expandtab:	when on use space instead of tab
" textwidth:	text wrap width
" autoindent:	autoindent in new line
set tabstop 	=4
set softtabstop	=4
set shiftwidth	=4
set textwidth	=79
set expandtab
set autoindent

" Show the matching part of pairs [] {} and () "
set showmatch

" remove trailing whitespace from Python and fortain files "
autocmd BufWritePre *.py :%s/\s\+$//e
autocmd BufWritePre *.pf90 :%s/\s\+$//e
autocmd BufWritePre *.p95y :%s/\s\+$//e
autocmd BufWritePre *.for :%s/\s\+$//e


" xterm_clipboard active "
set clipboard=unnamedplus


" Call the .vimrc.plug file
if filereadable(expand("~/.vimrc.plug"))
    source ~/.vimrc.plug
endif

" ligthline.vim Settings
set laststatus=2
if !has('gui_running')
  set t_Co=256
endif
set noshowmode
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }

" NERDTree Settings
" Start NERDTree and leave the cursor in it.
" autocmd VimEnter * NERDTree

nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>
