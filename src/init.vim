
" --------------------------------------------------------
" NVIM PLUGIN SETTINGS
" --------------------------------------------------------
"
" Plugins will be downloaded under the specified directory.
call plug#begin('~/.config/nvim/plugged')

" Themes
Plug 'vim-airline/vim-airline-themes' " Themes for airline bar
Plug 'jacoborus/tender.vim' " A 24bit colorscheme for Vim, Airline and Lightline (generated by Estilo)

" Navigation / Tabs /Tags / Bars
Plug 'scrooloose/nerdtree' " file navigation left panel
Plug 'junegunn/fzf.vim' " allow you to open a file instantly after typing a rough representation of its name.
Plug 'vim-airline/vim-airline' " bottom status and navigation bar
Plug 'terryma/vim-multiple-cursors' " hence the name
Plug 'jistr/vim-nerdtree-tabs'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'numirias/semshi', { 'do': ':UpdateRemotePlugins' }
Plug 'TaDaa/vimade' " Show current document
Plug 'majutsushi/tagbar'

" Git
Plug 'tpope/vim-fugitive' " Fugitive is the premier Vim plugin for Git
Plug 'airblade/vim-gitgutter'

" Syntax / Highlight/ Check
Plug 'tpope/vim-fireplace'
Plug 'itchyny/lightline.vim' " Highlight current line
Plug 'mattn/emmet-vim' " Syntax and tools for html and tag languages
Plug 'dense-analysis/ale' " Sytax checker
Plug 'peterhoeg/vim-qml'
Plug 'Yggdroot/indentLine' "  For identation
Plug 'artoj/qmake-syntax-vim'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'rust-lang/rust.vim'
Plug 'tikhomirov/vim-glsl'
Plug 'luochen1990/rainbow' "rainbow brackets and parenthesis
Plug 'frazrepo/vim-rainbow' " rainbow brackets and parenthesis
Plug 'andymass/vim-matchup' " lets you highlight, navigate, and operate on sets of matching text
Plug 'Raimondi/delimitMate' " This plug-in provides automatic closing of quotes, parenthesis, brackets, etc

" Auto completion
Plug 'nvie/vim-flake8' " static syntax and style checker for Python source code | F7 to run checker
Plug 'davidhalter/jedi-vim' " awesome Python autocompletion with VIM | :help jedi-vim
Plug 'ervandew/supertab' " Supertab is a vim plugin which allows you to use <Tab> to autocomplete

" Snippets
Plug 'SirVer/ultisnips' " UltiSnips is the ultimate solution for snippets in Vim
Plug 'honza/vim-snippets'

" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Misc
Plug 'tpope/vim-commentary'
Plug 'vim-scripts/grep.vim'
Plug 'editor-bootstrap/vim-bootstrap-updater'

" List ends here. Plugins become visible to Vim after this call.
call plug#end()

" --------------------------------------------------------
" NVIM VARIABLE SETTINGS
" --------------------------------------------------------
" Based on great settings by:
" https://gist.github.com/synasius/5cdc75c1c8171732c817
"

" For Neovim 0.1.3 and 0.1.4
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" Themes
syntax enable
colorscheme tender
let g:airline_theme='solarized'
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'
let g:airline_powerline_fonts = 1
let g:airline_solarized_bg='dark' " Dark bg for solarized airline theme

" Spaces & Tabs
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set shiftwidth=4    " number of spaces to use for autoindent
set expandtab       " tabs are space
set autoindent
set copyindent      " copy indent from the previous line

" UI Config
set hidden
set number                   " show line number
set relativenumber
set showcmd                  " show command in bottom bar
set cursorline               " highlight current line
set wildmenu                 " visual autocomplete for command menu
set showmatch                " highlight matching brace
set laststatus=2             " window will always have a status line

" Clipboard
set clipboard+=unnamedplus

" Search
set incsearch       " search as characters are entered
set hlsearch        " highlight matche
set ignorecase      " ignore case when searching
set smartcase       " ignore case if search pattern is lower case

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" Fugitive status line
if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" Title
set title
set titleold="Terminal"
set titlestring=%F

" Folding
set foldenable
set foldlevelstart=10  " default folding level when buffer is opened
set foldnestmax=10     " maximum nested fold
set foldmethod=syntax  " fold based on indentation

" Leader & Mappings
let mapleader='\'   " leader is backslash
nmap <leader>w :w<CR>
nmap <leader>x :x<CR>
nmap <leader>q :q<CR>
nmap <leader>! :q!<CR>

" insert blank line before current line without leaving insert mode
imap <leader>o <c-o><s-o>

" move up/down consider wrapped lines
nnoremap j gj
nnoremap k gk

" fix indentation
nnoremap <leader>i mzgg=G`z<CR>

" buffers
nnoremap <tab> :bn<CR>
nnoremap <s-tab> :bp<CR>
nnoremap <leader>bd :bd<CR>

" split navigation
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

"" Git
noremap <Leader>ga :Gwrite<CR>
noremap <Leader>gc :Gcommit<CR>
noremap <Leader>gsh :Gpush<CR>
noremap <Leader>gll :Gpull<CR>
noremap <Leader>gs :Gstatus<CR>
noremap <Leader>gb :Gblame<CR>
noremap <Leader>gd :Gvdiff<CR>
noremap <Leader>gr :Gremove<CR>

" session management
nnoremap <leader>so :OpenSession<Space>
nnoremap <leader>ss :SaveSession<Space>
nnoremap <leader>sd :DeleteSession<CR>
nnoremap <leader>sc :CloseSession<CR>

"" Tabs
nnoremap <Tab> gt
nnoremap <S-Tab> gT
nnoremap <silent> <S-t> :tabnew<CR>

" Open the nerdtree window when opening up Nvim, but put the cursor in the file-editing window
augroup nerdtree_open
    autocmd!
    autocmd VimEnter * NERDTree | wincmd p
augroup END

" Enable colorized brackets with vim-rainbow
let g:rainbow_active = 1 "set to 0 if you want to enable it later via :RainbowToggle
let g:rainbow_guifgs = ['RoyalBlue3', 'DarkOrange3', 'DarkOrchid3', 'FireBrick']
let g:rainbow_ctermfgs = ['lightblue', 'lightgreen', 'yellow', 'red', 'magenta']

" Enable matching syntax
let g:loaded_matchit = 1
