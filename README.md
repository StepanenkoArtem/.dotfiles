# .dotfiles

My personal config files, portable across machines.

## Layout

```
.dotfiles/
├── nvim/          # Neovim (LazyVim) config — symlinked to ~/.config/nvim
├── tmux/          # tmux config — tmux.conf symlinked to ~/.tmux.conf
├── install.sh     # bootstrap script for a fresh machine
├── LICENSE
└── README.md
```

## Install on a fresh machine

```sh
git clone git@github.com:StepanenkoArtem/.dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install.sh
```

Then start tmux and press `prefix + I` (capital i) to install tmux plugins via TPM.
Neovim will auto-install LazyVim plugins on first launch.

## Editing

Edit files directly inside `~/.dotfiles/` — `~/.config/nvim` and `~/.tmux.conf`
are symlinks, so changes are seen immediately. Reload tmux with `prefix + r`.

## Adding a new tool

1. Create a folder for it (e.g. `zsh/`)
2. Add a `link` call in `install.sh` for its target path
3. Commit
