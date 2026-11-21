# Neovim Cheatsheet

> Open: `<leader>?` | Close: `q` | Search this page: `/keyword`
> `<leader>` = **Space**. Forgot a key? Press `<leader>` and wait for which-key hints.

## Basics

| Key                | Action                                |
| ------------------ | ------------------------------------- |
| `<Esc>`            | Clear search highlight                |
| `<C-h/j/k/l>`      | Move to left/down/up/right window     |
| `<M-h>` / `<M-l>` | Narrower / wider window (Alt)        |
| `<M-k>` / `<M-j>` | Taller / shorter window (Alt)        |
| `<C-^>`            | Jump back to the previous file        |
| `J` / `K` (visual) | Move selected lines down/up           |

Windows (built-in): `<C-w>s` split horizontally | `<C-w>v` split vertically |
`<C-w>q` close | `<C-w>o` close others | `<C-w>=` equalize sizes.

## Buffers (bufferline at the top)

| Key           | Action                                          |
| ------------- | ----------------------------------------------- |
| `L` / `H`     | Next / previous buffer (in bufferline order)    |
| `]b` / `[b`   | Same as `L` / `H`                               |
| `]B` / `[B`   | Move current buffer right / left                |
| `<leader>bj`  | Pick a buffer by the letter shown on the bar    |
| `<leader>bd`  | Close buffer (keeps the window, asks if unsaved) |
| `<leader>bo`  | Close all other buffers                         |
| `<leader>bl`  | Close all buffers to the left                   |
| `<leader>br`  | Close all buffers to the right                  |
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
| `<leader>fS` | Symbols in project (LSP)   |
| `<leader>fd` | Diagnostics in file        |
| `<leader>fh` | Search help                |
| `<leader>fr` | Resume last search         |

Inside fzf: `Enter` open | `Ctrl-s` horizontal split | `Ctrl-v` vertical split |
`Ctrl-t` new tab | `Esc` quit.

## Search & replace

| Key / command        | Action                                                  |
| -------------------- | ------------------------------------------------------- |
| `<leader>sr`         | Search & replace in project (grug-far), word under cursor prefilled |
| `<leader>sr` (visual) | Same, prefilled with the selection                     |
| `<leader>sf`         | Search & replace in the current file only (grug-far)    |
| `:%s/old/new/g`      | Replace in file (live preview while typing)             |
| `:%s/old/new/gc`     | Replace in file, confirm each match (`y`/`n`/`a`/`q`)   |
| `grn`                | Rename symbol everywhere (LSP)                          |

Inside grug-far (`<localleader>` is also Space):

| Key                  | Action                                     |
| -------------------- | ------------------------------------------ |
| `Tab` / `S-Tab`      | Next / previous input (search, replace, files filter, flags, paths) |
| `<localleader>r`     | Replace all                                |
| `<localleader>s`     | Sync: apply edits made in the results list back to files |
| `dd` on a result line | Exclude that match from Sync (`<localleader>s`) |
| `Enter`              | Go to the match                            |
| `<localleader>i`     | Preview the match                          |
| `<localleader>q`     | Send results to quickfix                   |
| `<localleader>t`     | History                                    |
| `<localleader>c`     | Close                                      |
| `g?`                 | Show all keys                              |

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
| `gd`              | Go to definition (fzf)              |
| `gD`              | Go to declaration                   |
| `K`               | Hover documentation                 |
| `grr`             | References (fzf, with preview)      |
| `gri`             | Implementations (fzf)               |
| `grt`             | Type definition (fzf)               |
| `grn`             | Rename symbol                       |
| `<leader>ca`      | Code action with preview (normal or visual) |
| `gra`             | Code action (built-in, fzf picker)  |
| `gO`              | Symbols in file (fzf)               |
| `<leader>fS`      | Symbols in whole project (fzf)      |
| `<C-s>` (insert)  | Signature help                      |
| `<leader>cf`      | Format (file or selection)          |
| `<leader>ch`      | Toggle inlay hints                  |
| `<leader>cd`      | Line diagnostics                    |
| `]d` / `[d`       | Next / previous diagnostic          |
| `<C-o>` / `<C-i>` | Jump back / forward                 |

Files are formatted automatically on save.

Tip: press `K` or `<leader>cd` **twice** to move the cursor into the popup
(scroll with `j`/`k`/`Ctrl-d`/`Ctrl-u`, copy with `y`, close with `q`).
Moving the cursor in the code first closes the popup. `<C-w>w` also jumps into
an open popup, `<C-w>p` jumps back.

## Frontend (React / Next.js / Vite)

- LSP: TypeScript, ESLint (needs `eslint` in the project), Tailwind CSS
  (class completion, `K` shows the generated CSS), CSS/SCSS, HTML, Emmet.
- Emmet: type an abbreviation like `div.card>ul>li*3`, then accept it with `<C-y>`.
- Tags close and rename automatically in JSX/TSX/HTML (`<div>` adds `</div>`).
- Prettier from the project's `node_modules` is used when present.
- Run the dev server in a terminal: `<C-\>` then `npm run dev`.

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
