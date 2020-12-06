set nocompatible
packadd minpac
call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('morhetz/gruvbox')                                          "colorscheme
call minpac#add('chriskempson/base16-vim')                                  "colorscheme collection
call minpac#add('justinmk/vim-sneak')                                       "fav motion
"call minpac#add('davidhalter/jedi-vim')                                     "python completion
"call minpac#add('dense-analysis/ale')
"call minpac#add('neoclide/coc.nvim', {'branch': 'release'})
call minpac#add('tpope/vim-surround')
call minpac#add('junegunn/fzf', {'dir': '~/.fzf', 'do': './install --all'})
call minpac#add('junegunn/fzf.vim')
call minpac#add('tpope/vim-fugitive')
call minpac#add('jiangmiao/auto-pairs')
call minpac#add('machakann/vim-highlightedyank')

" Markdown stuff
call minpac#add('godlygeek/tabular')                                        "tab help
call minpac#add('plasticboy/vim-markdown')                                  "markdown

colorscheme gruvbox
set background=dark
set rtp+=/usr/bin/fzf
let &t_ut=''
set updatetime=1000
set scrolloff=5             "make it so there are always ten lines below my cursor
set paste                   "somehow makes pasting not that junk but :checkhealth throws errors cuz of it
set ignorecase              "better search options
set smartcase
set splitright              "prefer windows splitting to the right
set splitbelow              "prefer windows splitting below
set cursorline              "Highlight the screen line of the cursor with CursorLine
set noequalalways             "When on, all the windows are automatically made the same size after splitting or closing a window.
set cmdheight=1
set ruler                   "show the line and column number of the cursor position
set encoding=utf-8
set termguicolors           "enable true colors support
set noautoindent            "no autoindent. obvious
set shiftwidth=4            "indent shiftwidth =4 (>char)
set tabstop=4               "how many tabs to show for spaces when opening files
set softtabstop=4           "number of spaces in tab when editing
set fileformat=unix
set expandtab               "tabs are spaces
set relativenumber          "show relative line numbers
set number                  "show number of current line
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

nnoremap <SPACE> <Nop>
" mapping space to be leader key
let mapleader = " "
" double pressing leader alternates between previously opened buffer
nnoremap <Leader><Leader> <C-^>

nnoremap j gj
nnoremap k gk

" YANK HIGHLIGHT SETTING
let g:highlightedyank_highlight_duration = 100

" FZF MAPPING
nnoremap <silent> <leader>b :Buffers<cr>
nnoremap <silent> <leader>f :FZF<cr>
nnoremap <silent> <leader>F :FZF ~<cr>

" CUSTOM COMMANDS
command! PackUpdate packadd minpac | source $MYVIMRC | call minpac#update('', {'do': 'call minpac#status()'})
command! PackClean  packadd minpac | source $MYVIMRC | call minpac#clean()
command! PackStatus packadd minpac | source $MYVIMRC | call minpac#status()
command! Cleanshit g/^$/d
