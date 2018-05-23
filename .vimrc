execute pathogen#infect()

set mouse=a
set number
set expandtab
set nowrap
set autoindent
set shiftwidth=2
set background=dark

colorscheme solarized

syntax enable

autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif


