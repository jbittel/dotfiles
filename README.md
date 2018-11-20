### Bootstrap

```bash
# Create missing directories
mkdir -p ~/.config/i3 ~/.config/termite ~/.mplayer

# Symlink config files
ln -s ~/.dotfiles/.vimrc ~/.vimrc
ln -s ~/.dotfiles/i3config ~/.config/i3/config
ln -s ~/.dotfiles/.gitconfig ~/.gitconfig
ln -s ~/.dotfiles/termite ~/.config/termite/config
ln -s ~/.dotfiles/mplayer/config ~/.mplayer/config

# Source bash aliases
cat << EOF >> ~/.bash_aliases

if [ -f ~/.dotfiles/.bash_aliases ]; then
    . ~/.dotfiles/.bash_aliases
fi
EOF
```
