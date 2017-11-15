" enter the current millenium (no vi compatible)
set nocompatible


" color setup
set t_Co=256
colorscheme badwolf


" enable syntax and plugings
syntax on
filetype plugin on


" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**


" Search down into subfolders
" Displays all matching files when using tab completion
set wildmenu

" For ctags
" set tags=./tags;/


" Tweaks for browsing (:edit)
let g:netrw_banner=0 " disable banners
let g:netrw_browse_split=4 " open in prior window
let g:netrw_altv=1 " open splits to the right
let g:netrw_liststyle=3 " tree view
let g:netrw_list_hide=netrw_gitignore#Hide()
let g:netrw_list_hide.=',\(^\|\s\s)\zs\.\S\+'


let mapleader=","

" Search down into subfolders
" file handler setup
set tabstop=4
set softtabstop=4
set expandtab
"colorcolumn
set cc=80
set number
set showcmd
set cursorline
set showmatch
set incsearch
set hlsearch
nnoremap <leader><space> :nohlsearch<CR>
set foldenable
nnoremap B ^
nnoremap E $
nnoremap gV `[v`]
inoremap ds <esc>
nnoremap <leader>u :GundoToggle<CR>
" possible test nnoremap <leader>s :mksession<CR>
nnoremap <leader>s :w<CR> 

" Easier navigation through windows
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
