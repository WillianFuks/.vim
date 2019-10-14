" indent when moving to the next line
set autoindent
set smartindent         " even better autoindent (e.g. add indent after '{')

" run python code
imap <F5> <Esc>:w<CR>:!clear;python %<CR>
