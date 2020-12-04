set nocompatible
packadd minpac
call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('morhetz/gruvbox')                                          "colorscheme
call minpac#add('chriskempson/base16-vim')                                  "colorscheme collection
call minpac#add('justinmk/vim-sneak')                                       "fav motion
call minpac#add('davidhalter/jedi-vim')                                     "python completion
call minpac#add('w0rp/ale')                                                 "async error check
call minpac#add('tpope/vim-surround')
call minpac#add('junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'})
call minpac#add('junegunn/fzf.vim')
call minpac#add('dense-analysis/ale')
" call minpac#add('neoclide/coc.nvim', {'branch': 'release'})

" Markdown stuff
call minpac#add('godlygeek/tabular')                                        "tab help
call minpac#add('plasticboy/vim-markdown')                                  "markdown

call minpac#add('scrooloose/nerdtree', { 'on':  'NERDTreeToggle' })         "file explorer


colorscheme gruvbox

" Load the plugins right now. (optional)
" packloadall

set rtp+=/usr/bin/fzf
let &t_ut=''
set ruler
set encoding=utf-8
set termguicolors           "enable true colors support
set noautoindent            "no autoindent. obvious
set shiftwidth=4            "indent shiftwidth =4 (>char)
set tabstop=4               "how many tabs to show for spaces when opening files
set softtabstop=4           "number of spaces in tab when editing
set fileformat=unix
set expandtab               "tabs are spaces
set relativenumber          "show relative line numbers
set number
set hidden                  "keep buffer changes and lets me jump between buffers
set wildmenu                "visual autocomplete for command menu
set lazyredraw              "redraw only when we need to
set showmatch               "highlight matching [{()}]
set incsearch               "search as characters are entered
set hlsearch                "highlight matches
set foldenable              "enable folding
set foldlevelstart=10       "open most folds by default
set foldnestmax=10          "10 nested fold max
set foldmethod=manual       "fold based on indent level
set noswapfile
let g:sneak#label = 1       "make sneak even greater

let g:jedi#use_splits_not_buffers = "right"
nnoremap <SPACE> <Nop>
let mapleader = " "
nnoremap <Leader><Leader> <C-^>
nnoremap j gj
nnoremap k gk

" FZF MAPPING
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>

let g:ale_fixers = {
            \   '*': ['remove_trailing_lines', 'trim_whitespace'],
            \   'javascript': ['eslint'],
            \   'yaml': ['yamllint'],
            \   'python': ['flake8', 'pylint'],
            \}

let g:ale_completion_enabled = 1
let g:ale_lint_on_text_changed = 1
let g:ale_linters = {
            \   'yaml': ['yamllint'],
            \   'python': ['autopep8', 'yapf'],
            \}

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)


" Define user commands for updating/cleaning the plugins.
" Each of them loads minpac, reloads .vimrc to register the
" information of plugins, then performs the task.
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
"toggle nerdTree
map <C-n> :NERDTreeToggle<CR>
