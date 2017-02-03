let mapleader="\<SPACE>"

syntax on

call plug#begin('~/.vim/plugged')

" Make sure you use single quotes

Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'Shougo/vimfiler.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'airblade/vim-gitgutter'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'avdgaag/vim-phoenix'
Plug 'mxw/vim-jsx'
Plug 'mkitt/tabline.vim'
Plug 'scrooloose/nerdcommenter'
"Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'
Plug 'slim-template/vim-slim'
Plug 'ddrscott/vim-side-search'
let g:side_search_prg = 'ag --word-regexp'
      \. " --ignore='*.js.map'"
      \. " --heading --stats -B 1 -A 4"
" Can use `vnew` or `new`
let g:side_search_splitter = 'vnew'
" I like 40% splits, change it if you don't
let g:side_search_split_pct = 0.4
" SideSearch current word and return to original window
nnoremap <Leader>ss :SideSearch <C-r><C-w><CR> | wincmd p
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
  let g:deoplete#enable_at_startup = 1
  " use tab for completion
  inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Languages
" Plug 'isRuslan/vim-es6'
" Plug 'pangloss/vim-javascript'
" Plug 'othree/yajs.vim'
" Plug 'mxw/vim-jsx'
" Plug 'elixir-lang/vim-elixir'
" Plug 'vim-ruby/vim-ruby'

Plug 'sheerun/vim-polyglot'
" Add plugins to &runtimepath
call plug#end()

" react jsx
let g:jsx_ext_required = 0 " Allow JSX in normal JS files

syntax on
filetype plugin indent on

" Color scheme
set t_Co=256
set background=dark
colorscheme Tomorrow-Night


" basics
set showcmd             " Show (partial) command in status line.
set showmatch           " Show matching brackets.
set showmode            " Show current mode.
set ruler               " Show the line and column numbers of the cursor.
set number              " Show the line numbers on the left side.
set formatoptions+=o    " Continue comment marker in new lines.
set textwidth=0         " Hard-wrap long lines as you type them.
set tabstop=2           " Render TABs using this many spaces.
set softtabstop=2
set expandtab           " Insert spaces when TAB is pressed.
set shiftwidth=2        " Indentation amount for < and > commands.

set noerrorbells        " No beeps.
set modeline            " Enable modeline.
set esckeys             " Cursor keys in insert mode.
set linespace=0         " Set line-spacing to minimum.
set nojoinspaces        " Prevents inserting two spaces after punctuation on a join (J)

" More natural splits
set splitbelow          " Horizontal split below current.
set splitright          " Vertical split to right of current.

" design
set cursorline
set cursorcolumn

if !&scrolloff
  set scrolloff=3       " Show next 3 lines while scrolling.
endif
if !&sidescrolloff
  set sidescrolloff=5   " Show next 5 columns while side-scrolling.
endif
set display+=lastline
set nostartofline       " Do not jump to first character with page commands.

" Tell Vim which characters to show for expanded TABs,
" trailing whitespace, and end-of-lines. VERY useful!
if &listchars ==# 'eol:$'
  set listchars=tab:>\ ,trail:-,extends:>,precedes:<,nbsp:+
endif
set list                " Show problematic characters.

" Also highlight all tabs and trailing whitespace characters.
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$\|\t/

set hlsearch            " Highlight search results.
set ignorecase          " Make searching case insensitive
set smartcase           " ... unless the query has capital letters.
set incsearch           " Incremental search.
set gdefault            " Use 'g' flag by default with :s/foo/bar/.
set magic               " Use 'magic' patterns (extended regular expressions).

" Use <C-L> to clear the highlighting of :set hlsearch.
if maparg('<C-L>', 'n') ==# ''
  nnoremap <silent> <C-L> :nohlsearch<CR><C-L>
endif

" Search and Replace
nmap <Leader>s :%s//g<Left><Left>

" Airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#enabled = 2
let g:airline#extensions#tabline#show_close_button = 0
let g:airline#extensions#tabline#fnamemod = ':t'
let g:airline_left_sep = ''
let g:airline_right_sep = ''
"let g:airline#extensions#tabline#show_tab_nr = 0
let g:airline_theme= 'tomorrow'

" Nerdtree
nnoremap <C-N> :NERDTreeToggle<CR>

" nerdcommented
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Use compact syntax for prettified multi-line comments
let g:NERDCompactSexyComs = 1

" Align line-wise comment delimiters flush left instead of following code indentation
let g:NERDDefaultAlign = 'left'

" Set a language to use its alternate delimiters by default
let g:NERDAltDelims_java = 1

" Add your own custom formats or override the defaults
let g:NERDCustomDelimiters = { 'c': { 'left': '/**','right': '*/' } }

" Allow commenting and inverting empty lines (useful when commenting a region)
let g:NERDCommentEmptyLines = 1

" Enable trimming of trailing whitespace when uncommenting
let g:NERDTrimTrailingWhitespace = 1

" VimFiler
"let g:vimfiler_as_default_explorer = 1
"nnoremap <C-N> :VimFiler<CR>


" CtrlP
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|deps\|_build\|log\|node_modules\|tmp$',
  \ 'file': '\.exe$\|\.so$\|\.dat$'
  \ }
nnoremap <Leader>o :CtrlP<CR>
" Open buffer menu
nnoremap <Leader>b :CtrlPBuffer<CR>
" Open most recently used files
nnoremap <Leader>f :CtrlPMRUFiles<CR>

" undo files
set undodir=~/.vim/.undo//
set backupdir=~/.vim/.backup//
set directory=~/.vim/.swp//




" Custom bindings
nmap <Leader>init e ~/.config/nvim/init.vim<CR>

nmap <Leader>w :w<CR>
nmap <Leader>x :bdelete<CR>
nmap <Leader>q :q<CR>
nmap <Leader>i :syntax on<CR>
" navigation buffers
nmap K :bnext<CR>
nmap J :bprevious<CR>

" split navigation
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" Start UNDOtree
nnoremap <F3> :UndotreeToggle<CR>
let g:undotree_SetFocusWhenToggle = 1
if has("persistent_undo")
    set undodir=~/.vim/.undodir/
    set undofile
endif
nmap <buffer> J <plug>UndotreeGoNextState
nmap <buffer> K <plug>UndotreeGoPreviousState
nmap <Leader>h :nohl<CR>
