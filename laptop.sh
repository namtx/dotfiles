# brew
ln -s ./Brewfile ~

ln -s ./.zshrc ~

# nvim
ln -s ./nvim/init.vim ~/.config/nvim/init.vim
ln -s ./nvim/after/ftplugin/* ~/.config/nvim/after/ftplugin
ln -s ./nvim/autoload/* ~/.config/nvim/autoload

# coc-vim
ln -s ./nvim/coc-settings.json ~/.config/nvim/coc-settings.json
ln -s ./coc/extensions/package.json ~/.config/coc/extensions/package.json

# skhd
ln -s ./skhd/skhdrc ~/.config/skhd

# yabai
ln -s ./yabai/yabairc ~/.config/yabai

# spacebar
ln -s ./spacebar/spacebarrc ~/.config/spacebar

# kitty
ln -s ./kitty/* ~/.config/kitty

# karabiner
ln -s ./karabiner/karabiner.json ~/.config/karabiner
