set number

call plug#begin()
	Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
	Plug 'junegunn/seoul256.vim'
	Plug 'justinmk/vim-sneak'
call plug#end()

let g:sneak#label = 1

set bg=light
let g:seoul256_background = 256
colo seoul256
