"VIMRUNTIME="$(nvim --clean --headless --cmd 'echo $VIMRUNTIME|q')"
"/usr/share/nvim/runtime

call plug#begin('~/.config/nvim/plugged')
    "cosmetics
        Plug 'https://github.com/chriskempson/base16-vim.git'
        Plug 'ayu-theme/ayu-vim'
        Plug 'itchyny/lightline.vim'
        Plug 'shinchu/lightline-seoul256.vim'
        Plug 'junegunn/goyo.vim'
        Plug 'junegunn/seoul256.vim'
        Plug 'gko/vim-coloresque'
    "code
        "Plug '~/.vim/plugged/vim-love-docs'     "LÖVE completion
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'junegunn/fzf.vim'                 "fuzzy search
        Plug 'w0rp/ale'                         "error check
        Plug 'tpope/vim-surround'
        Plug 'vim-syntastic/syntastic'          "for error checking
        Plug 'xolox/vim-lua-ftplugin'           "lua completion maybe
        Plug 'xolox/vim-misc'                   "xolox's scripts to work with his other plugins
        Plug 'Shougo/neopairs.vim'              "supposedly auto pair
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        else
            Plug 'Shougo/deoplete.nvim'
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
        endif
call plug#end()
filetype plugin indent on

let g:deoplete#enable_at_startup = 1


"deoplete-vim-lua-ftplugin START
    let g:lua_check_syntax = 0
    let g:lua_complete_omni = 1
    let g:lua_complete_dynamic = 0
    let g:lua_define_completion_mappings = 0

    call deoplete#custom#var('omni', 'functions', {
                \ 'lua': 'xolox#lua#omnifunc',
                \ })
    call deoplete#custom#var('omni', 'input_patterns', {
                \ 'lua': '\w+|\w+[.:]\w*',
                \ })
"END


let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ }

let &t_ut=''                "asszem colorscheme tearinget állítja be vagy ez vagy pedig valami kitty.conf-ban
colorscheme wombat256mod
"colorscheme seoul256-light
"colorscheme ayu
"let ayucolor="light"
syntax enable   	        "enables syntax highlighting
"syntax checker options start
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = 'eslint_d'
"syntax checker options end

set termguicolors           "enable true colors support
set autoindent              "autoindent. obvious
set shiftwidth=4            "indent shiftwidth =4 (>char)
set tabstop=4               "how many tabs to show for spaces when opening files
set softtabstop=4           "number of spaces in tab when editing
set expandtab smarttab      "tabs are spaces
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
"set noswapfile


"""REMAP"""
"move vertically by visual line
nnoremap j gj

"move vertically by visual line
nnoremap k gk

"auto expand brackets
inoremap (\ (<CR>)<C-c>O
inoremap {\ {<CR>}<C-c>O
inoremap [\ [<CR>]<C-c>O
inoremap func\ function() {<CR>}<C-c>O

"toggle nerdTree
map <C-n> :NERDTreeToggle<CR>   
