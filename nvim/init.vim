"VIMRUNTIME="$(nvim --clean --headless --cmd 'echo $VIMRUNTIME|q')"
"/usr/share/nvim/runtime

call plug#begin('~/.config/nvim/plugged')
    "cosmetics
        Plug 'morhetz/gruvbox'                  "noice theme
        Plug 'fxn/vim-monochrome'               "monochrome colorscheme
        Plug 'andreypopp/vim-colors-plain'      "another monocolor
        Plug 'https://github.com/chriskempson/base16-vim.git'
        Plug 'ayu-theme/ayu-vim'
        Plug 'itchyny/lightline.vim'
        Plug 'shinchu/lightline-seoul256.vim'
        Plug 'junegunn/goyo.vim'
        Plug 'junegunn/seoul256.vim'
        Plug 'gko/vim-coloresque'
    "code
        "Plug '~/.vim/plugged/vim-love-docs'     "LÖVE completion
        Plug 'justinmk/vim-sneak'             "wonderful motion plugin shortcut 's' in normal mode
        Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
        Plug 'artur-shaik/vim-javacomplete2'    "java completion for deoplete
        Plug 'junegunn/fzf.vim'                 "fuzzy search
        Plug 'w0rp/ale'                         "error check
        Plug 'tpope/vim-surround'
        Plug 'vim-syntastic/syntastic'          "for error checking
        Plug 'xolox/vim-lua-ftplugin'           "lua completion maybe
        Plug 'xolox/vim-misc'                   "xolox's scripts to work with his other plugins
        Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
        if has('nvim')
            Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
        else
            Plug 'Shougo/deoplete.nvim'
            Plug 'roxma/nvim-yarp'
            Plug 'roxma/vim-hug-neovim-rpc'
        endif
call plug#end()
filetype plugin indent on

let g:sneak#label = 1       "help label if needs explanation
let mapleader = "ő"
let g:deoplete#enable_at_startup = 1


"Add extra filetypes for deoplete(ternjs)
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]

"javacomplete2 stuff
    let g:deoplete#omni_patterns = {}
    let g:deoplete#omni_patterns.java = '[^. *\t]\.\w*'
    let g:deoplete#sources = {}
    let g:deoplete#sources._ = []
    let g:deoplete#file#enable_buffer_path = 1
    if !exists('g:deoplete#omni#input_patterns')
        let g:deoplete#omni#input_patterns = {}
    endif


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


""Justin M. Keyes's colorscheme {{{
"func! s:colors() abort
"    " Clear `Normal` cterm values, so terminal emulators won't treat negative
"    " space as extra whitespace (makes mouse-copy nicer).
"    hi Normal cterm=NONE ctermfg=NONE ctermbg=NONE guifg=white guibg=black
"    hi Cursor gui=NONE cterm=NONE guibg=#F92672 guifg=white ctermbg=47 ctermfg=black
"    hi Whitespace ctermfg=LightGray
"    hi SpecialKey ctermfg=241 guifg=#626262
"    hi! link SpecialChar Whitespace
"    hi! link NonText Comment
"    hi Comment guifg=#7E8E91 ctermfg=244
"    hi! link Constant Normal
"
"    hi QuickFixLine guifg=black guibg=cyan ctermfg=black ctermbg=cyan
"    " Special should be (at least slightly) distinct from SpecialKey.
"    hi Special ctermfg=LightCyan guifg=LightCyan
"    " hi Special guifg=#F92672 gui=bold ctermfg=197 cterm=NONE
"
"    " cyan
"    hi Identifier ctermfg=cyan guifg=cyan
"    hi! link Statement Identifier
"    hi! link Exception Identifier
"    hi! link Title Identifier
"    " affects:
"    "   - NONE string in 'hi Normal ctermfg=NONE …'
"    "   - helpHeader
"    hi! link PreProc Special
"
"    hi! link Type Identifier
"    hi String guifg=LightGreen guibg=NONE gui=NONE ctermfg=LightGreen ctermbg=NONE cterm=NONE
"    hi MoreMsg guifg=cyan guibg=NONE gui=NONE ctermfg=cyan ctermbg=NONE cterm=NONE
"    hi! link Question MoreMsg
"
"    hi Todo guibg=white guifg=black ctermbg=white ctermfg=black
"    hi! link WildMenu Search
"
"    " completion/popup menu
"    hi Pmenu guifg=#FFFFFF guibg=#585858 gui=NONE ctermfg=255 ctermbg=240 cterm=NONE
"    hi! link PmenuSel Search
"    hi PmenuSbar guibg=darkgray ctermbg=darkgray
"    hi PmenuThumb ctermbg=lightgreen ctermfg=lightgreen
"
"    " tabline
"    " hi default link TabLineFill TabLine
"    hi! link TabLineFill TabLine
"
"    " diff (unified)
"    hi diffAdded       guifg=#00ff5f gui=NONE      ctermfg=lightgreen  cterm=NONE
"    hi diffRemoved     guifg=#ff5f5f gui=NONE      ctermfg=203 cterm=NONE
"    hi link diffSubname Normal
"
"    " diff (side-by-side)
"    hi DiffAdd         guifg=#000000 guibg=#00ff5f ctermfg=0   ctermbg=lightgreen  gui=NONE cterm=NONE
"    hi DiffChange      guifg=#FFFFFF guibg=#4C4745 ctermfg=255 ctermbg=239 gui=NONE cterm=NONE
"    hi DiffDelete      guifg=#ff5f5f guibg=NONE    ctermfg=203 ctermbg=NONE gui=NONE cterm=NONE
"    hi DiffText        guifg=black   guibg=cyan    ctermfg=16  ctermbg=cyan gui=NONE cterm=NONE
"
"    "If 242 is too dark, keep incrementing...
"    hi FoldColumn      guifg=#465457 guibg=#000000 ctermfg=242 ctermbg=16
"    hi Folded          guifg=#465457 guibg=NONE    ctermfg=242 ctermbg=NONE
"
"    hi Error           guifg=#FFFFFF   guibg=Red   ctermfg=15 ctermbg=9
"    hi ErrorMsg        ctermfg=203 ctermbg=NONE guifg=#ff5f5f guibg=#161821
"    " alternative: 227, 185, 191 (too green)
"    hi WarningMsg      guifg=#d7ff5f ctermfg=185
"
"    " alternative: 227, 185, 191 (too green)
"    " hi Search guifg=#000000 guibg=#d7ff5f ctermfg=0 ctermbg=227 gui=NONE cterm=NONE
"    hi! Search ctermbg=LightCyan ctermfg=black guibg=LightCyan guifg=black
"    hi! link IncSearch QuickFixLine
"    hi! link Substitute QuickFixLine
"
"    hi Visual gui=NONE cterm=NONE guifg=black guibg=white ctermfg=black ctermbg=white
"    hi StatusLine cterm=bold,reverse gui=bold,reverse
"    hi! link ColorColumn StatusLine
"    hi StatusLineNC guifg=bg guibg=darkgrey ctermfg=232 ctermbg=242 cterm=NONE gui=NONE
"    hi VertSplit guifg=#808080 guibg=#080808 gui=bold ctermfg=244 ctermbg=232 cterm=bold
"
"    hi! link Directory Identifier
"    hi CursorLine guibg=#303030 ctermbg=235 cterm=NONE
"    hi! link LineNr CursorLine
"    hi! link SignColumn StatusLineNC
"    hi! link CursorLineNr Normal
"
"    hi SpellBad ctermbg=red ctermfg=255 cterm=undercurl gui=undercurl guisp=Red
"    hi SpellCap ctermbg=lightgrey ctermfg=red cterm=undercurl gui=undercurl guisp=white
"    hi! link SpellRare SpellCap
"
"    hi Underlined ctermfg=NONE cterm=underline gui=underline guifg=NONE
"
"    " other
"    hi helpHyperTextJump cterm=underline ctermfg=cyan gui=underline guifg=cyan
"    hi MatchParen cterm=bold,underline ctermfg=lightgreen ctermbg=NONE guifg=black guibg=white
"endfunc
"au VimEnter * call <SID>colors()
""}}}



let g:lightline = {
            \ 'colorscheme': 'seoul256',
            \ }

let &t_ut=''                "asszem colorscheme tearinget állítja be vagy ez vagy pedig valami kitty.conf-ban
"set background=dark     "for monochrome plain -- you can also set it to light
colorscheme base16-gruvbox-dark-pale
""colorscheme seoul256-light
""colorscheme ayu
""let ayucolor="light"
"syntax enable   	        "enables syntax highlighting
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

"better splits navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

"auto expand brackets
inoremap (\ (<CR>)<C-c>O
inoremap {\ {<CR>}<C-c>O
inoremap [\ [<CR>]<C-c>O
inoremap func\ function() {<CR>}<C-c>O

"toggle nerdTree
map <C-n> :NERDTreeToggle<CR>   
