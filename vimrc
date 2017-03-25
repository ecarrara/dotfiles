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
set list listchars=tab:»·,trail:·

let mapleader=','

syntax on
filetype plugin indent on

au FileType * set expandtab tabstop=4 shiftwidth=4 softtabstop=4

" tab navigation
map <C-Tab> :tabnext<CR>
map <S-Tab> :tabprevious<CR>

" highlight 80 column
let &colorcolumn=join(range(80,81),",")

" VIM Addons
set runtimepath+=~/.vim/addons/vim-addon-manager

call vam#ActivateAddons(['github:w0ng/vim-hybrid'])
call vam#ActivateAddons(['github:oblitum/rainbow'])
call vam#ActivateAddons(['github:kien/ctrlp.vim'])
call vam#ActivateAddons(['github:scrooloose/nerdtree'])
call vam#ActivateAddons(['github:majutsushi/tagbar'])
call vam#ActivateAddons(['github:honza/vim-snippets'])
call vam#ActivateAddons(['github:airblade/vim-gitgutter'])
call vam#ActivateAddons(['github:SirVer/ultisnips'])
call vam#ActivateAddons(['github:honza/vim-snippets'])
call vam#ActivateAddons(['github:scrooloose/syntastic'])
call vam#ActivateAddons(['github:bling/vim-airline'])
call vam#ActivateAddons(['github:rust-lang/rust.vim'])
call vam#ActivateAddons(['github:albfan/nerdtree-git-plugin'])
call vam#ActivateAddons(['github:mattn/emmet-vim'])
call vam#ActivateAddons(['github:racer-rust/vim-racer'])
call vam#ActivateAddons(['github:posva/vim-vue'])
call vam#ActivateAddons(['github:vim-scripts/a.vim'])

" colors
set bg=dark
colors hybrid

let g:airline_powerline_fonts = 1

" Sytastic
let g:syntastic_c_include_dirs = ['include', 'third_party/glad/include']


" NERDTree mappings
nnoremap <silent> <F9> :NERDTreeToggle <cr>
inoremap <silent> <F9> <Esc>:NERDTreeToggle <cr>

" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.?(git|hg|svn|venv|lib|vendor)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" NERDTree
let NERDTreeIgnore = ['\.pyc$', '__pycache__', '\.egg_info$']

autocmd Filetype json setlocal ts=2 sts=2 sw=2

" Rust Racer
let g:racer_experimental_completer = 1


autocmd Filetype tex setlocal spell spelllang=pt
