# Neovim Cheatsheet

> Open: `<leader>?` | Close: `q` | Search this page: `/keyword`
> `<leader>` = **Space**. Forgot a key? Press `<leader>` and wait for which-key hints.

## Basics

| Key                | Action                                |
| ------------------ | ------------------------------------- |
| `<leader>w`        | Save file                             |
| `<leader>q`        | Close window                          |
| `<Esc>`            | Clear search highlight                |
| `<C-h/j/k/l>`      | Move to left/down/up/right window     |
| `<C-^>`            | Jump back to the previous file        |
| `J` / `K` (visual) | Move selected lines down/up           |

## Buffers (bufferline at the top)

| Key           | Action                                          |
| ------------- | ----------------------------------------------- |
| `]b` / `[b`   | Next / previous buffer (in bufferline order)    |
| `]B` / `[B`   | Move current buffer right / left                |
| `<leader>bj`  | Pick a buffer by the letter shown on the bar    |
| `<leader>bd`  | Close buffer (keeps the window, asks if unsaved) |
| `<leader>bo`  | Close all other buffers                         |
| `<leader>bp`  | Pin / unpin buffer                              |

## Find (fzf-lua)

| Key          | Action                     |
| ------------ | -------------------------- |
| `<leader>ff` | Find files                 |
| `<leader>fg` | Grep project               |
| `<leader>fw` | Grep word under cursor     |
| `<leader>fb` | Buffers                    |
| `<leader>fm` | Marks (bookmarks)          |
| `<leader>fs` | Symbols in file (LSP)      |
| `<leader>fd` | Diagnostics in file        |
| `<leader>fh` | Search help                |
| `<leader>fr` | Resume last search         |

Inside fzf: `Enter` open | `Ctrl-s` horizontal split | `Ctrl-v` vertical split |
`Ctrl-t` new tab | `Esc` quit.

## Bookmarks (built-in marks)

| Key                           | Action                                                  |
| ----------------------------- | ------------------------------------------------------- |
| `mA` ... `mZ`                 | Set a **global** mark (works from any file, persists across sessions) |
| `ma` ... `mz`                 | Set a mark **local to the current file**                |
| `'A`                          | Jump to the line of mark A                              |
| `` `A ``                      | Jump to the exact line and column of mark A             |
| `<leader>fm`                  | List all marks and jump to one                          |
| `Ctrl-x` (inside `<leader>fm`) | Delete the selected mark                               |
| `:delmarks A`                 | Delete mark A                                           |

Tip: name marks after the file's first letter, e.g. `mL` for `lsp.lua`.

## File tree (neo-tree)

| Key          | Action                                        |
| ------------ | --------------------------------------------- |
| `<leader>e`  | Toggle file tree (reveals the current file)   |
| `<leader>be` | Buffer list as a tree                         |

Inside the tree:

| Key             | Action                                       |
| --------------- | -------------------------------------------- |
| `Enter` / `o`   | Open file / expand or collapse directory     |
| `C` / `z`       | Collapse directory / collapse all            |
| `s` / `S`       | Open in vertical / horizontal split          |
| `t`             | Open in new tab                              |
| `P`             | Preview                                      |
| `a`             | Add file (end with `/` to create a directory) |
| `A`             | Add directory                                |
| `d`             | Delete                                       |
| `r`             | Rename                                       |
| `y` / `x` / `p` | Copy / cut / paste                           |
| `c` / `m`       | Copy / move to a path                        |
| `H`             | Toggle hidden files                          |
| `/`             | Filter by name                               |
| `.` / `<BS>`    | Set as root / go to parent directory         |
| `R`             | Refresh                                      |
| `?`             | Show all keys                                |
| `q`             | Close                                        |

## Directory as a buffer (oil)

| Key       | Action                                  |
| --------- | --------------------------------------- |
| `-`       | Open the parent directory of this file  |
| `Enter`   | Open file / enter directory             |
| `_`       | Go to the working directory (cwd)       |
| `g.`      | Toggle hidden files                     |
| `<C-p>`   | Preview                                 |
| `g?`      | Show all keys                           |

Rename, delete or create files by **editing the text normally**, then `:w` to apply.

## Terminal (toggleterm)

| Key            | Action                                         |
| -------------- | ---------------------------------------------- |
| `<C-\>`        | Toggle terminal 1 (floating, works inside it)  |
| `2<C-\>`, `3<C-\>` | Toggle terminal 2, 3, ... (created if missing) |
| `<leader>tf`   | Floating terminal                              |
| `<leader>th`   | Horizontal terminal (bottom)                   |
| `<leader>tv`   | Vertical terminal (right)                      |
| `<leader>ts`   | Select a terminal from the list                |
| `<leader>tk`   | Kill the current / last focused terminal       |
| `<C-\><C-n>`   | Leave terminal mode (to normal mode)           |
| `exit` / `Ctrl-d` | Quit the shell; the terminal closes itself  |

`<C-\>` only hides the terminal; the process keeps running.
Inside the terminal every key goes to the shell (`Esc`, `Ctrl-l`, `Ctrl-k`, ...).
Name a terminal with `:ToggleTermSetName <name>`; hide/show all with `:ToggleTermToggleAll`.

## LSP (code)

| Key               | Action                              |
| ----------------- | ----------------------------------- |
| `gd`              | Go to definition                    |
| `gD`              | Go to declaration                   |
| `K`               | Hover documentation                 |
| `grr`             | References                          |
| `gri`             | Go to implementation                |
| `grn`             | Rename symbol                       |
| `<leader>ca`      | Code action with preview (normal or visual) |
| `gra`             | Code action (built-in, fzf picker)  |
| `gO`              | Symbols in file                     |
| `<C-s>` (insert)  | Signature help                      |
| `<leader>cf`      | Format (file or selection)          |
| `<leader>ch`      | Toggle inlay hints                  |
| `<leader>cd`      | Line diagnostics                    |
| `]d` / `[d`       | Next / previous diagnostic          |
| `<C-o>` / `<C-i>` | Jump back / forward                 |

Files are formatted automatically on save.

## Completion (blink.cmp)

| Key                 | Action                             |
| ------------------- | ---------------------------------- |
| `<C-Space>`         | Open menu / show documentation     |
| `<C-n>` / `<C-p>`   | Next / previous item               |
| `<C-y>`             | Accept                             |
| `<C-e>`             | Close menu                         |
| `<C-b>` / `<C-f>`   | Scroll documentation up / down     |
| `<C-k>`             | Toggle signature help              |
| `<Tab>` / `<S-Tab>` | Jump between snippet placeholders  |

Brackets and quotes close automatically (nvim-autopairs). `Enter` between `{}` puts
the cursor on an indented line; `Backspace` on an empty pair deletes both;
typing the closing bracket just jumps over it.

## Git (gitsigns)

| Key           | Action                          |
| ------------- | ------------------------------- |
| `]h` / `[h`   | Next / previous hunk            |
| `<leader>gs`  | Stage hunk                      |
| `<leader>gr`  | Reset hunk                      |
| `<leader>gp`  | Preview hunk                    |
| `<leader>gb`  | Blame current line              |
| `<leader>gg`  | Lazygit (floating, repo root)   |

Inside lazygit: `space` stage/unstage file | `enter` open file to stage lines |
`c` commit | `P` push | `p` pull | `[` / `]` switch tab | `?` all keys | `q` quit.

## Useful commands

| Command                | Action                                      |
| ---------------------- | ------------------------------------------- |
| `:Lazy`                | Manage plugins (`U` update, `S` sync)       |
| `:Mason`               | Manage LSP servers / formatters             |
| `:ConformInfo`         | Show which formatter applies to this file   |
| `:checkhealth`         | Check the installation for problems         |
| `:checkhealth vim.lsp` | Show running LSP clients                    |
| `:TSUpdate`            | Update treesitter parsers                   |

Reinstall everything on a new machine: `~/.config/nvim/install.sh`
