### Bootstrap

Source aliases:

```bash
ln -s ~/.dotfiles/.bash_aliases .bash_aliases
```

Apply configuration:

```bash
# Create directories
mkdir -p ~/.config/alacritty ~/.config/sway ~/.config/waybar

# Symlink config files
ln -s ~/.dotfiles/sway/config ~/.config/sway/config
ln -s ~/.dotfiles/waybar/config.jsonc ~/.config/waybar/config.jsonc
ln -s ~/.dotfiles/waybar/style.css ~/.config/waybar/style.css
ln -s ~/.dotfiles/waybar/colorscheme.css ~/.config/waybar/colorscheme.css
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/alacritty.toml ~/.config/alacritty/alacritty.toml
ln -s ~/.dotfiles/.vimrc ~/.vimrc
```
