" ============================================================================
" Vim-plug initialization
" Avoid modify this section, unless you are very sure of what you are doing

let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.vim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.vim/autoload
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

" Obscure hacks done, you can now modify the rest of the .vimrc as you wish :)

" ============================================================================
" Active plugins
" You can disable or add new ones here:

" this needs to be here, so vim-plug knows we are declaring the plugins we
" want to use
call plug#begin('~/.vim/plugged')

" Plugins from github repos:

" Better file browser
Plug 'scrooloose/nerdtree'
" Code commenter
Plug 'scrooloose/nerdcommenter'
" Class/module browser
Plug 'majutsushi/tagbar'
" Code and files fuzzy finder
Plug 'ctrlpvim/ctrlp.vim'
" Lightline
Plug 'itchyny/lightline.vim'
Plug 'itchyny/vim-gitbranch'
"" Surround
Plug 'tpope/vim-surround'
"" Autoclose
Plug 'Townk/vim-autoclose'
"" Git/mercurial/others diff icons on the side of the file lines
Plug 'mhinz/vim-signify'
"" Python and other languages code checker
Plug 'scrooloose/syntastic'
"" Ack code search (requires ack installed in the system)
Plug 'mileszs/ack.vim'
"" Better display unwanted whitespace.
Plug 'ntpeters/vim-better-whitespace'
"" Automatically set 'shiftwidth' + 'expandtab' (indention) based on file type.
Plug 'tpope/vim-sleuth'
"" Markdown support
Plug 'godlygeek/tabular' "| Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': ':call mkdp#util#install()', 'for': 'markdown', 'on': 'MarkdownPreview' }
"" Auto completion
Plug 'Valloric/YouCompleteMe'
"" Best colorscheme ever
Plug 'sjl/badwolf'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sheerun/vim-wombat-scheme'

if has('python3')
    "" Automatically sort python imports
    Plug 'fisadev/vim-isort'
endif


" Tell vim-plug we finished declaring plugins, so it can load them
call plug#end()

" ============================================================================
" Install plugins the first time vim runs

if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

" ============================================================================
" Vim settings and mappings
" You can edit them as you wish

" no vi compatible
set nocompatible

if (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256') || has('nvim')
	let &t_Co = 256
    colorscheme badwolf
endif

" Add syntax highlighting
if has("syntax")
  syntax on
endif

set background=dark

filetype plugin on
filetype indent on

set clipboard^=unnamed,unnamedplus
" Copy to clipboard
" from: https://www.reddit.com/r/neovim/comments/3fricd/easiest_way_to_copy_from_neovim_to_system/
vnoremap <leader>y  "*y
nnoremap <leader>Y  "+yg_
nnoremap <leader>y  "+y
nnoremap <leader>yy  "+yy

" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" redraw screen only when we need to
set lazyredraw

" Search down into subfolders
" Displays all matching files when using tab completion
set wildmenu

" for ctags
set tags+=./tags;

" colorcolumn
set cc=89

" show line numbers
set number

" shows input command on right down corner
set showcmd

" show a visual line under the cursor's current position
set cursorline

" highlights enclosing symbol )]}
set showmatch

" improves searching
set incsearch
set hlsearch
set ignorecase
set smartcase

" when scrolling, keep cursor 3 lines away from screen border
set scrolloff=3

" always show status bar
set ls=2

" Enable folding
set foldenable
set foldmethod=indent
set foldlevel=99

" Comment this line to enable autocompletion preview window
" (displays documentation related to the selected completion option)
" Disabled by default because preview makes the window flicker
set completeopt-=preview

" better backup, swap and undos storage
set directory=~/.vim/dirs/tmp     " directory to place swap files in
set backup                        " make backup files
set backupdir=~/.vim/dirs/backups " where to put backup files
set undofile                      " persistent undos - undo after you re-open the file
set undodir=~/.vim/dirs/undos
set viminfo+=n~/.vim/dirs/viminfo
" store yankring history file there too
let g:yankring_history_dir = '~/.vim/dirs/'

" create needed directories if they don't exist
if !isdirectory(&backupdir)
    call mkdir(&backupdir, "p")
endif
if !isdirectory(&directory)
    call mkdir(&directory, "p")
endif
if !isdirectory(&undodir)
    call mkdir(&undodir, "p")
endif

" ============================================================================
" Plugins settings and mappings
" Edit them as you wish.

" hotkey
let mapleader=","

" Tagbar -----------------------------

" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

" NERDTree -----------------------------

" toggle nerdtree display
map <F3> :NERDTreeToggle<CR>
" open nerdtree with the current file selected
nmap ,t :NERDTreeFind<CR>
" don;t show these file types
let NERDTreeIgnore = ['\.pyc$', '\.pyo$']

" CtrlP ------------------------------

nmap <C-p> :CtrlP<cr>
" Easy bindings for its various modes
nmap <leader>bb :CtrlPBuffer<cr>
nmap <leader>bm :CtrlPMixed<cr>
nmap <leader>bs :CtrlPMRU<cr>

" don't change working directory
let g:ctrlp_working_path_mode = 0
" ignore these files and folders on file finder
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/](\.git|\.hg|\.svn|node_modules)$',
  \ 'file': '\.pyc$\|\.pyo$',
  \ }

" Syntastic ------------------------------

" show list of errors and warnings on the current file
"nmap <leader>e :Errors<CR>

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_aggregate_errors = 1
""" don't put icons on the sign column (it hides the vcs status icons of signify)
let g:syntastic_enable_signs = 1
let g:syntastic_python_python_exec = 'python3'
" use flake8
"let g:syntastic_python_checkers = ['flake8']

" YouCompleteMe ------------------------------

nnoremap <leader>jd :YcmCompleter GoTo<CR>

" Signify ------------------------------

" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = [ 'git', 'hg' ]
"" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
"" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

" Lightline ------------------------------

let g:lightline = {
  \   'colorscheme': 'wombat',
  \   'active': {
  \     'left':[ [ 'mode', 'paste' ],
  \              [ 'gitbranch', 'readonly', 'filename', 'modified' ]
  \     ]
  \   },
	\   'component': {
	\     'lineinfo': ' %3l:%-2v',
	\   },
  \   'component_function': {
  \     'gitbranch': 'gitbranch#name',
  \   }
  \ }
let g:lightline.separator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.subseparator = {
	\   'left': '', 'right': ''
  \}
let g:lightline.tabline = {
  \   'left': [ ['tabs'] ],
  \   'right': [ ['close'] ]
  \ }
set showtabline=2  " Show tabline
set guioptions-=e  " Don't use GUI tabline

" vim-markdown ------------------------------

let g:vim_markdown_frontmatter=1


" markdown-preview.nvim ------------------------------

let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/.vim/submodules/github-markdown-css/github-markdown.css'

" ============================================================================
" mappings

" removes highlighting from search query
nnoremap <leader><space> :nohlsearch<CR>
nnoremap <esc><esc> :noh<cr>
" moves to beginning of line
nnoremap B ^
" moves to end of line
nnoremap E $
vnoremap E $
" visual mode for whole code
nnoremap gV `[v`]
" leaves insert mode
inoremap fd <esc>
" Undo
nnoremap <leader>u :GundoToggle<CR>
" possible test nnoremap <leader>s :mksession<CR>
nnoremap <leader>w :w<CR>
" Easier navigation through windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" closes current buffer window
nnoremap <silent> <leader>q :lclose<bar>b#<bar>bd #<CR>
" simple recursive grep
nnoremap ,r :Ack
nnoremap ,wr :Ack <cword><CR>
" Map Fold Toggle from zi to ft
nnoremap ft zi
" Map Fold Open from za to fo
nnoremap fo za
" Map Fold Close from zc to fc
nnoremap fc zc
" For visual moves
nnoremap j gj
nnoremap k gk
