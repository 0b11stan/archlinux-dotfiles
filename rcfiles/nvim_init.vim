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
  Plug 'scrooloose/nerdtree', { 'on': 'NERDTree' }
  Plug 'sheerun/vim-polyglot'
  Plug 'shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'vim-scripts/vim-autopep8', { 'on': 'Autopep8' }
  Plug 'rhysd/vim-clang-format',
  Plug 'zchee/deoplete-clang'
  Plug 'junegunn/goyo.vim'
	Plug 'alvan/vim-closetag'
	Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
call plug#end()

call deoplete#enable()

" <TAB>: completion.
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<TAB>"

let NERDTreeWinSize=21
