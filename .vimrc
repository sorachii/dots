set number

call plug#begin()
        Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
        Plug 'junegunn/fzf.vim', { 'commit': '3f75a8369f63f2bd6ac3686fc5d88f2bc128e610' }
        Plug 'junegunn/seoul256.vim'
        Plug 'justinmk/vim-sneak'
call plug#end()

nnoremap <SPACE> <Nop>
let mapleader=" "

let g:sneak#label = 1

set bg=light
let g:seoul256_background = 256
colo seoul256
