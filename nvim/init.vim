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
" VIM-PLUG
"

call plug#begin('~/.local/share/nvim/plugged')

"
" General
"
Plug 'junegunn/vim-easy-align'
Plug 'vim-syntastic/syntastic'
Plug 'vimlab/split-term.vim'

"
" Polyglot
"
Plug 'sheerun/vim-polyglot'

"
" Python
"
Plug 'vim-scripts/python.vim'
Plug 'vim-scripts/python_match.vim'
Plug 'davidhalter/jedi-vim'
Plug 'jmcantrell/vim-virtualenv'
let g:python_host_prog = $PYTHON2_BIN
let g:python3_host_prog = $PYTHON3_BIN

"
" Rust
"
Plug 'rust-lang/rust.vim'
Plug 'racer-rust/vim-racer'
set hidden
let g:racer_cmd = $RACER_BIN
let g:racer_experimental_completer = 1

"
" YAML
"
Plug 'avakhov/vim-yaml'

"
" Nerd Tree
"
Plug 'scrooloose/nerdtree'
" Disable the scrollbars (NERDTree)
set guioptions-=r
set guioptions-=L
" Keep NERDTree window fixed between multiple toggles
set winfixwidth
nmap <tab> :NERDTreeToggle<cr>

"
" Nerd Commenter
"
Plug 'scrooloose/nerdcommenter'
nmap <leader># :call NERDComment(0, "invert")<cr>
vmap <leader># :call NERDComment(0, "invert")<cr>

" https://github.com/scrooloose/nerdcommenter#settings
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 1


"
" Custom Color Scheme (fork of lucius)
"
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
" split-term.vim fork
"

let s:force_vertical = exists('g:split_term_vertical') ? 1 : 0
let s:map_keys = exists('g:disable_key_mappings') ? 0 : 1

" utilities around neovim's :term

" Remaps specifically a few keys for a better terminal buffer experience.
"
" - Rebind <Esc> to switch to normal mode
" - Bind Alt+hjkl, Ctrl+arrows to navigate through windows (eg. switching to
"   buffer/windows left, right etc.)
fun! s:defineMaps()
  " Allow hitting <Esc> to switch to normal mode
  tnoremap <buffer> <Esc> <C-\><C-n>

  " Alt+[hjkl] to navigate through windows in insert mode
  tnoremap <buffer> <A-h> <C-\><C-n><C-w>h
  tnoremap <buffer> <A-j> <C-\><C-n><C-w>j
  tnoremap <buffer> <A-k> <C-\><C-n><C-w>k
  tnoremap <buffer> <A-l> <C-\><C-n><C-w>l

  " Alt+[hjkl] to navigate through windows in normal mode
  nnoremap <buffer> <A-h> <C-w>h
  nnoremap <buffer> <A-j> <C-w>j
  nnoremap <buffer> <A-k> <C-w>k
  nnoremap <buffer> <A-l> <C-w>l

  " Ctrl+Arrows to navigate through windows in insert mode
  tnoremap <buffer> <C-Left>  <C-\><C-n><C-w>h
  tnoremap <buffer> <C-Down>  <C-\><C-n><C-w>j
  tnoremap <buffer> <C-Up>    <C-\><C-n><C-w>k
  tnoremap <buffer> <C-Right> <C-\><C-n><C-w>l

  " Ctrl+Arrows to navigate through windows in normal mode
  nnoremap <buffer> <C-Left>  <C-w>h
  nnoremap <buffer> <C-Down>  <C-w>j
  nnoremap <buffer> <C-Up>    <C-w>k
  nnoremap <buffer> <C-Right> <C-w>l
endfunction

" Opens up a new buffer, either vertical or horizontal. Count can be used to
" specify the number of visible columns or rows.
fun! s:openBuffer(count, vertical)
  let cmd = a:vertical ? 'vnew' : 'new'
  let cmd = a:count ? a:count . cmd : cmd
  exe cmd
endf

" Opens a new terminal buffer, but instead of doing so using 'enew' (same
" window), it uses :vnew and :new instead. Usually, I want to open a new
" terminal and not replace my current buffer.
fun! s:openTerm(args, count, vertical)
  let params = split(a:args)
  let direction = s:force_vertical ? 1 : a:vertical

  call s:openBuffer(a:count, direction)
  exe 'terminal' a:args
  exe 'startinsert'
  if s:map_keys
    call s:defineMaps()
  endif
endf

"
" vim-cargo fork
"

if !exists('g:cargo_command')
  let g:cargo_command = "fish -i -C 'cargo {cmd}'"
endif

com! -nargs=* CargoBench call cargo#run('bench ' . <q-args>)
com! -nargs=* CargoBuild call cargo#run('build ' . <q-args>)
com! -nargs=* CargoCheck call cargo#run('check ' . <q-args>)
com! -nargs=* CargoClean call cargo#run('clean ' . <q-args>)
com! -nargs=* CargoDoc call cargo#run('doc ' . <q-args>)
com! -nargs=* CargoRun call cargo#run('run ' . <q-args>)
com! -nargs=* CargoTest call cargo#run('test ' . <q-args>)
com! -nargs=* CargoUpdate call cargo#run('update ' . <q-args>)
" com! -complete=file -nargs=+ CargoNew call cargo#run('new ' . <q-args>)

" Executes {cmd} with the cwd set to {pwd}, without changing Vim's cwd.
" If {pwd} is the empty string then it doesn't change the cwd.
function! s:system(pwd, cmd)
	let cmd = a:cmd
	if !empty(a:pwd)
		let cmd = 'cd ' . shellescape(a:pwd) . ' && ' . cmd
	endif
	return system(cmd)
endfunction

func! cargo#run(cmd)
	write
  let s:cargo_command = substitute(g:cargo_command, "{cmd}", a:cmd, 'g')
	" echo s:cargo_command
  call s:openTerm(s:cargo_command, 0, 0)
endf

autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs compiler cargo
autocmd BufRead,BufNewFile Cargo.toml,Cargo.lock,*.rs setlocal makeprg=cargo
autocmd BufNewFile,BufRead *.rs set filetype=rust


"
" GENERAL
"

filetype plugin indent on
set number
syntax on

set mouse=a

" Opens all folds when file opened
autocmd BufWinEnter * silent! :%foldopen!

" TODO: I've forked this, should change the name
colorscheme lucius
LuciusBlack


"
" MAPPINGS
"

nnoremap <C-_> :call NERDComment(0, "invert")<cr>
vnoremap <C-_> :call NERDComment(0, "invert")<cr>

noremap <F5> :CargoRun<cr>
nnoremap U :redo<CR>
vnoremap U :redo<CR>

" tnoremap <Esc> <C-\><C-n>

au FileType rust nmap gd <Plug>(rust-def)
au FileType rust nmap gs <Plug>(rust-def-split)
au FileType rust nmap gx <Plug>(rust-def-vertical)
au FileType rust nmap <leader>gd <Plug>(rust-doc)

" You want to be part of the gurus? Time to get in serious stuff and stop using
" arrow keys.
noremap <left> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <right> <nop>


" Navigation & UI {{{

" more natural movement with wrap on
nnoremap j gj
nnoremap k gk
vnoremap j gj
vnoremap k gk

" Easy splitted window navigation
noremap <C-h>  <C-w>h
noremap <C-j>  <C-w>j
noremap <C-k>  <C-w>k
noremap <C-l>  <C-w>l

" Easy buffer navigation
noremap <leader>bp :bprevious<cr>
noremap <leader>bn :bnext<cr>

" Splits ,v and ,h to open new splits (vertical and horizontal)
nnoremap <leader>v <C-w>v<C-w>l
nnoremap <leader>h <C-w>s<C-w>j

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Bubbling lines
nmap <C-Up> [e
nmap <C-Down> ]e
vmap <C-Up> [egv
vmap <C-Down> ]egv

" }}}

" . folding {{{

set foldlevelstart=0
set foldmethod=syntax

" Space to toggle folds.
nnoremap <space> za
vnoremap <space> za

" Make zO recursively open whatever top level fold we're in, no matter where the
" cursor happens to be.
nnoremap zO zCzO

" Use ,z to "focus" the current fold.
nnoremap <leader>z zMzvzz

" }}}
