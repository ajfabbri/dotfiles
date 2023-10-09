# Config Files for Life in the Command Prompt

## Installation

When I start working on a new machine, I simply:
```
cd ~
git clone https://github.com/ajfabbri/dotfiles.git
dotfiles/install.sh
```

## Neovim Keybindings

| Key(s)     | Binding         |
| ---------- | --------------- |
| gr | goto References (telescope) |
| \<leader\>ff | Find File (telescope) |
| \<leader\>ft | find File Text (telescope) |
| \<leader\>fr | File Recents (telescope) |
| \<leader\>sh | Search help (telescope) |
| \<leader\>sm | Search man pages (telescope) |
| \<leader\>sr | Search registers (telescope) |
| \<leader\>sk | Search keymaps (telescope) |
| \<leader\>sk | Search commands (telescope) |
| \<leader\>rn | Rename (lsp) |
| \<leader\>fb | Format Buffer (lsp) |
| \<leader\>ca | Code Action (lsp) |
| K          | lsp hover |
| gd         | goto definition |
| gD         | goto declaration |
| gi         | goto implemenations |
| go         | goto type defn of obj. |
| gr         | goto references |
| gs         | goto signature |
| gl         | goto list of diagnostics |
| [d         | previous diag. |
| ]d         | next diag. |
| \<C-y\> or \<CR\>?  | confirm selection |
| \<C-e\>     | cancel completion |
| \<Down\>     | Next item |
| \<Up\>     | Prev item |
| \<C-n\>     | Trigger completion / next item |
| \<C-p\>     | Trigger completion / prev item |
| \<C-u\>     | Scroll doc window up|
| \<C-d\>     | Scroll doc window down|
