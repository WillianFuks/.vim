# .vim
Vim setup for coding

Just run `git clone https://github.com/WillianFuks/.vim ~/.vim` and it's done.

## NERDTree

`F3` opens NT.

`,t` opens NT using current file as reference.

`t` opens tab.

`gt` switches tab.

`i` opens new buffer in horizontal window.

`gi` opens new buffer keeping cursor in tree.

`s` new vertical window file.

`gs` vertical file with cursor in tree.


## NERDCommenter

`<leader>cc` comments current line or visual mode selection.

`<leader>c<space>` toogles comments.

`<leader>c$` comments from cursor to end.

`<leader>cu` uncomment.

`r` or `R` reloads the tree to find new files.

## TabBar

Opens a window for tags exploration.
`F4` Toogles window.

## Ctrlp

`<C-p>` opens fuzzy file finder

`<C-v>` on ctrlp window vertically splits vim and opens the file.

`<F5>` updates ctrlp so new files are shown.

## vim-surround

`cs"'` changes `"` to `'`; press `cs` fast otherwise it won't work.

## Signify

    `+`     This line was added.

    `!`     This line was modified.

    `_1`    The number of deleted lines below this sign. If the number is larger
    `99`    than 9, the `_` will be omitted. For numbers larger than 99, `_>`
    `_>`    will be shown instead.

    `!1`    This line was modified and the lines below were deleted.
    `!>`    It is a combination of `!` and `_`. If the number is larger than 9,
          `!>` will be shown instead.

    `‾`     The first line was removed. It's a special case of the `_` sign.

## Syntastic

The acticated virtualenv should contain linters installed in order to work. To use flake8:

    pip install flake8

Default interpreter is `python3` as specified in the `vimrc` file.

## Markdown-preview.nvim

`:MarkdownPreview` starts github emulator on the browser.

## YouCompleteMe

YCM only works on vim 8.1+ so it has to be installed apart. For doing so just run:

```sh
sudo add-apt-repository ppa:jonathonf/vim
sudo apt update
sudo apt install vim
```
After installing via `Plug` for the first time, the server still won't work. Go to the folder where YCM was installed (probably `~/.vim/plugged/YouCompleteMe/`) and run

    python3 install.py

After that, it'll work properly.

`<leader>jd` jumps to definition. After jumping, use `Ctrl-O` to come back (`Ctrl-I` will jump forward again).

[Official docs](https://github.com/ycm-core/YouCompleteMe#ycmcompleter-subcommands) have all available commands.
