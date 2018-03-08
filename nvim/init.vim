"
" TODO
"

let g:python_host_prog = $PYTHON2_BIN
let g:python3_host_prog = $PYTHON3_BIN


"
" VIM-PLUG
"

call plug#begin('~/.local/share/nvim/plugged')

Plug 'junegunn/vim-easy-align'

Plug 'scrooloose/nerdtree'
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
" Keep NERDTree window fixed between multiple toggles
set winfixwidth


" Initialize plugin system
call plug#end()
