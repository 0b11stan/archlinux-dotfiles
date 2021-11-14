set number
"set foldmethod=indent
set expandtab
set tabstop=2
set shiftwidth=2
set colorcolumn=81
set cursorline

autocmd BufNewFile,BufRead *.s set syntax=asm
hi CursorLine   cterm=NONE ctermbg=238
hi CursorColumn cterm=NONE ctermbg=238
nnoremap <Leader>c :set cursorline! cursorcolumn!<CR>

map <C-s> :FZF<CR>

tnoremap <Esc> <C-\><C-n>
tnoremap tj <C-\><C-N><C-w>h
tnoremap tk <C-\><C-N><C-w>j
tnoremap tl <C-\><C-N><C-w>k
tnoremap tm <C-\><C-N><C-w>l

noremap j h
noremap k j
noremap l k
noremap m l

noremap <C-m> <C-w>l
noremap <C-l> <C-w>k
noremap <C-k> <C-w>j
noremap <C-j> <C-w>h

" Plugins installation with vim-plug
call plug#begin(stdpath('data') . '/plugged')
	Plug 'andreshazard/vim-freemarker',
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
  Plug 'sheerun/vim-polyglot'
  Plug 'vim-scripts/vim-autopep8', { 'on': 'Autopep8' }
  Plug 'rhysd/vim-clang-format',
  Plug 'junegunn/goyo.vim'
	Plug 'alvan/vim-closetag'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
	Plug 'dart-lang/dart-vim-plugin'
	Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let NERDTreeWinSize=21
let dart_html_in_string=v:true
let g:dart_format_on_save = 1
let g:autopep8_diff_type='vertical'
"let g:autopep8_disable_show_diff=1

"=== Syntax highlight for objdump ==="

" standard guard against syntax clash
if exists("b:current_syntax")
    finish
endif

" Asm is our main syntax; C is an extra one
runtime! syntax/asm.vim
unlet b:current_syntax
syntax include @C syntax/c.vim
unlet b:current_syntax

" a line starting with [A-Za-z_] is a C line
syntax region odCLine start=/^\h/ end=/$/ keepend contains=@C

" a line starting with a hex number is an objdump address/opcode
" stop at [:xdigit:][:blank:][:blank:] to interpret the rest as asm instruction (default)
syntax region odHead start='^\s*\x\+\>' end=/\x\s\{2,}\|$/ keepend contains=odHex,asmIdentifier

" hex number w/o any prefix (deadbeef)
syntax match odHex '\<\x\+\>' contained
hi def link odHex hexNumber

" assign current syntax
let b:current_syntax = 'objdump'
