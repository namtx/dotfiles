PWD=$(pwd)
# brew
ln -s $PWD/Brewfile $HOME

ln -s $PWD/.zshrc $HOME

# nvim
ln -s $PWD/nvim/init.vim $HOME/.config/nvim/init.vim
ln -s $PWD/nvim/after/ftplugin/* $HOME/.config/nvim/after/ftplugin
ln -s $PWD/nvim/autoload/* $HOME/.config/nvim/autoload

# coc-vim
ln -s $PWD/nvim/coc-settings.json $HOME/.config/nvim/coc-settings.json
ln -s $PWD/coc/extensions/package.json $HOME/.config/coc/extensions/package.json

# skhd
ln -s $PWD/skhd/skhdrc $HOME/.config/skhd

# yabai
ln -s $PWD/yabai/yabairc $HOME/.config/yabai

# spacebar
ln -s $PWD/spacebar/spacebarrc $HOME/.config/spacebar

# kitty
ln -s $PWD/kitty/session.kitty $HOME/.config/kitty/session.kitty
ln -s $PWD/kitty/kitty. $HOME/.config/kitty/session.kitty

# karabiner
ln -s $PWD/karabiner/karabiner.json $HOME/.config/karabiner
