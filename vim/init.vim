" -- vim-plug
"
call plug#begin('~/.vim/plugged')

" fzf (installed by homebrew)
Plug '/usr/local/opt/fzf'
Plug 'junegunn/fzf.vim'

" nerdtree
Plug 'scrooloose/nerdtree'

" editorconfig vim
Plug 'editorconfig/editorconfig-vim'

" emmet
Plug 'mattn/emmet-vim'

" ale, linting
Plug 'dense-analysis/ale'

" youcompleteme
Plug 'ycm-core/YouCompleteMe'
"

call plug#end()

" -- NERDTree
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

let NERDTreeShowHidden=1
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeQuitOnOpen=1

" -- fzf
nnoremap <C-P> :Files<CR>

" -- key mappings
" don't use arrowkeys
"noremap <Up> <NOP>
"noremap <Down> <NOP>
"noremap <Left> <NOP>
"noremap <Right> <NOP>

" really, just don't
"inoremap <Up>    <NOP>
"inoremap <Down>  <NOP>
"inoremap <Left>  <NOP>
"inoremap <Right> <NOP>

