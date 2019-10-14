# .vim
Vim setup for coding

Just run `git clone https://github.com/WillianFuks/.vim ~/.vim` and it's done.

### NERDTree

`F3` opens NT.
`,t` opens NT using current file as reference.
`t` opens tab.
`gt` switches tab.
`i` opens new buffer in horizontal window.
`gi` opens new buffer keeping cursor in tree.
`s` new vertical window file.
`gs` vertical file with cursor in tree.


### NERDCommenter

`<leader>cc` comments current line or visual mode selection.
`<leader>c<space>` toogles comments.
`<leader>c$` comments from cursor to end.
`<leader>cu` uncomment.
`r` or `R` reloads the tree to find new files.

### TabBar

Opens a window for tags exploration.
`F4` Toogles window.

### ctrlp

`<C-p>` opens fuzzy file finder
`<C-v>` on ctrlp window vertically splits vim and opens the file.
`<F5>` updates ctrlp so new files are shown.

### vim-surround

`cs"'` changes `"` to `'`; press `cs` fast otherwise it won't work.

### coc

Conquer of Completion. First time running vim, you should also run
`:CocInstall coc-python` for Python support.

`<TAB>` to work.

nodejs is required; for installing it, download the sh script, change its mode and run it.

### signify

    `+`     This line was added.

    `!`     This line was modified.

    `_1`    The number of deleted lines below this sign. If the number is larger
    `99`    than 9, the `_` will be omitted. For numbers larger than 99, `_>`
    `_>`    will be shown instead.

    `!1`    This line was modified and the lines below were deleted.
    `!>`    It is a combination of `!` and `_`. If the number is larger than 9,
          `!>` will be shown instead.

    `‾`     The first line was removed. It's a special case of the `_` sign.

### syntastic
currently disabled in favor of pymode_python.

`,e` runs flake8
