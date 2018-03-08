"
" USER
"

set nocompatible

filetype on
filetype off

let g:lucius_style = 'dark'
let g:lucius_contrast = 'high'
let g:lucius_contrast_bg = 'high'


"
" PYTHON
"

let g:python_host_prog = $PYTHON2_BIN
let g:python3_host_prog = $PYTHON3_BIN


"
" VIM-PLUG
"

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'vim-scripts/python.vim'
Plug 'vim-scripts/python_match.vim'
Plug 'davidhalter/jedi-vim'
Plug 'jmcantrell/vim-virtualenv'

Plug 'scrooloose/nerdtree'
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
" Keep NERDTree window fixed between multiple toggles
set winfixwidth

Plug 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>


" Plug 'b33j0r/vim-lucius'
Plug '~/Projects/vim-lucius'

" Color schemes from vimified

Plug 'sjl/badwolf'
Plug 'altercation/vim-colors-solarized'
Plug 'tomasr/molokai'
Plug 'zaiste/Atom'
Plug 'w0ng/vim-hybrid'
Plug 'chriskempson/base16-vim'
Plug 'Elive/vim-colorscheme-elive'
Plug 'zeis/vim-kolor'
Plug 'xero/sourcerer.vim'


" During installation the molokai colorscheme might not be avalable
if filereadable(globpath(&rtp, 'colors/molokai.vim'))
  colorscheme molokai
else
  colorscheme default
endif

" Initialize plugin system
call plug#end()


"
" GENERAL
"

filetype plugin indent on
set number
syntax on

colorscheme lucius
LuciusBlack

highlight clear SignColumn


"
" MAPPINGS
"

" You want to be part of the gurus? Time to get in serious stuff and stop using
" arrow keys.
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>

