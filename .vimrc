" ============================
" Vim Configuration File
" ============================

" --- General ---
set nocompatible
set mouse=a
syntax on
filetype plugin indent on
set clipboard=unnamedplus

" --- UI ---
set number                      " Absolute line numbers
set cursorline                  " Highlight current line
highlight Cursorline cterm=bold ctermbg=black
set showmatch                   " Highlight matching brackets
set laststatus=2                " Always show statusline
if !has('gui_running')
  set t_Co=256
endif
set noshowmode                  " Hide default mode (lightline handles it)

" --- Search ---
set hlsearch
set ignorecase
set smartcase
set incsearch

" --- Indentation ---
set tabstop=4
set softtabstop=4
set shiftwidth=4
set textwidth=79
set expandtab
set autoindent
set smartindent

" Prevent auto comment on newline
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" Python: 4 spaces
autocmd FileType python setlocal tabstop=4 softtabstop=4 shiftwidth=4 expandtab

" Ruby: 2 spaces
autocmd FileType ruby setlocal tabstop=2 softtabstop=2 shiftwidth=2 expandtab

" --- Whitespace cleanup ---
autocmd BufWritePre *.py   :%s/\s\+$//e
autocmd BufWritePre *.pf90 :%s/\s\+$//e
autocmd BufWritePre *.p95y :%s/\s\+$//e
autocmd BufWritePre *.for  :%s/\s\+$//e

" --- Undo / Backup ---
set undofile
set backup
set writebackup

" ============================
" Load vim-plug plugins
" ============================
if empty(glob('~/.vim/autoload/plug.vim'))
    echo "vim-plug not installed"
else
    source ~/.vimrc.plug
endif

" ============================
" Plugin-specific settings
" ============================

" --- Lightline with file path (last 2 directories + filename) ---
function! LightlineFilepath()
  if empty(expand('%'))
    return '[No File]'
  endif
  let l:fullpath = expand('%:p:h')
  let l:parts = split(l:fullpath, '/')
  let l:last = join(l:parts[-2:], '/')
  return l:last . '/' . expand('%:t')
endfunction

let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filepath': 'LightlineFilepath'
      \ },
      \ }


" --- NERDTree ---
nnoremap <leader>n :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nnoremap <C-f> :NERDTreeFind<CR>

" --- AutoPairs ---
let g:AutoPairsMapCR = 0

