" General settings
set nocompatible               " Vim, not Vi!
set noswapfile                 " no swap files
set autoindent                 " auto indenting
set autoread                   " auto read external file changes
set history=500                " keep 500 lines of history
set ruler                      " show the cursor position
set hidden                     " hide buffer without notice
set hlsearch                   " highlight the last searched term
set showcmd                    " show number of lines selected
set foldmethod=marker          " folds on marks
set nowrap                     " don't wrap lines
set clipboard=unnamedplus      " for simplified clipboard copy/paste
set backspace=indent,eol,start " no constraints for backspace
set laststatus=2               " always display the statusline in all windows
set noshowmode                 " hide the default mode text (e.g. -- INSERT -- below the statusline)
set t_Co=256                   " configure for 256 colors terminal
set sessionoptions=blank,buffers,curdir,help,tabpages,winsize " discards plugin stuff on saving session
set pumheight=30               " limit popup menu height
set wildignore+=*.py[co]       " ignore *.py[co] files
set number                     " show line number
set cursorline                 " highlight current line
set noerrorbells               " no sound on errros
set novisualbell               " no blink on errors
set signcolumn=yes             " always show sign column
set cmdheight=2                " give more space for displaying messages
set shortmess+=c
set list listchars=tab:»·,trail:·

let mapleader=','

syntax on
filetype plugin indent on

au FileType * set expandtab tabstop=4 shiftwidth=4 softtabstop=4

" tab navigation
map <S-Tab> :tabnext<CR>


" Plug!
call plug#begin('~/.vim/plugged')
Plug 'w0ng/vim-hybrid'
Plug 'oblitum/rainbow'
Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'airblade/vim-gitgutter'
Plug 'dense-analysis/ale'
Plug 'bling/vim-airline'
Plug 'albfan/nerdtree-git-plugin'
Plug 'mattn/emmet-vim'
Plug 'junegunn/fzf'
Plug 'rust-lang/rust.vim', { 'for': 'rust' }
Plug 'neoclide/coc.nvim'
Plug 'posva/vim-vue'
Plug 'vim-scripts/a.vim'
call plug#end()

" colors
set bg=dark
colors hybrid

let g:airline_powerline_fonts = 1

" ALE
let g:ale_linters = {'rust': ['rls']}
let g:ale_fixers = {
\   '*': ['remove_trailing_lines', 'trim_whitespace'],
\   'rust': ['rustfmt'],
\}
let g:ale_fix_on_save = 1


" NERDTree mappings
nnoremap <silent> <F9> :NERDTreeToggle <cr>
inoremap <silent> <F9> <Esc>:NERDTreeToggle <cr>

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.?(git|hg|svn|venv|lib|vendor|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg_info$']

autocmd Filetype json setlocal ts=2 sts=2 sw=2

" COC
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if has('patch8.1.1068')
  " Use `complete_info` if your (Neo)Vim version supports it.
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)


autocmd Filetype tex setlocal spell spelllang=pt
