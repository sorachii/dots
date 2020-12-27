" TODO:

set nocompatible
packadd minpac
packadd nvim-lspconfig
call minpac#init()

" minpac must have {'type': 'opt'} so that it can be loaded with `packadd`.
call minpac#add('k-takata/minpac', {'type': 'opt'})
call minpac#add('morhetz/gruvbox')                                          "colorscheme
call minpac#add('junegunn/seoul256.vim')                                    "colorscheme
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
call minpac#add('neovim/nvim-lspconfig', {'type': 'opt'})
call minpac#add('nvim-lua/completion-nvim')


" Markdown stuff
call minpac#add('godlygeek/tabular')                                        "tab help
call minpac#add('plasticboy/vim-markdown')                                  "markdown

let g:seoul256_background = 236
colorscheme seoul256
set background=dark
set rtp+=/usr/bin/fzf
set rtp+=/home/megaman/git/neovim/runtime/lua/vim
let &t_ut=''
set updatetime=1000
set scrolloff=5             "make it so there are always ten lines below my cursor
set ignorecase              "better search options
set smartcase
set splitright              "prefer windows splitting to the right
set splitbelow              "prefer windows splitting below
set noequalalways            "When on, all the windows are automatically made the same size after splitting or closing a window.
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


" NVIM-LSP CONFIG
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy_list = ['exact', 'substring', 'fuzzy']
lua <<EOF
require'lspconfig'.pyls.setup{on_attach=require'completion'.on_attach}
require'lspconfig'.yamlls.setup{on_attach=require'completion'.on_attach}
EOF


" NVIM-LSP REMAPS
nnoremap <silent> <c-j>             <cmd>lua vim.lsp.buf.definition()<CR>
nnoremap <silent> K                 <cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> gD                <cmd>lua vim.lsp.buf.implementation()<CR>
nnoremap <silent> <c-k>             <cmd>lua vim.lsp.buf.signature_help()<CR>
nnoremap <silent> 1gD               <cmd>lua vim.lsp.buf.type_definition()<CR>
nnoremap <silent> gr                <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent> g0                <cmd>lua vim.lsp.buf.document_symbol()<CR>
nnoremap <silent> gW                <cmd>lua vim.lsp.buf.workspace_symbol()<CR>
nnoremap <silent> gd                <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent> gq                <cmd>lua vim.lsp.buf.formatting()<CR>
vnoremap <silent> gq                <cmd>lua vim.lsp.buf.range_formatting()<CR>
nnoremap <silent> ge                <cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <silent> gE                <cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <silent> gR                <cmd>lua vim.lsp.buf.rename()<CR>


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
