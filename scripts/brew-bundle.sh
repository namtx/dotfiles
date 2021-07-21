#!/bin/bash

sleep 1
echo -ne "🚩\r"
rm /Users/namtx/workspace/dotfiles/Brewfile
rm /Users/namtx/Brewfile

sleep 1
echo -ne "🙀\r"
brew bundle dump

echo -ne "🖇\r"
ln -s /Users/namtx/workspace/dotfiles/Brewfile /Users/namtx/Brewfile
echo -ne "✅\r"
