# Run this script to setup the dotfiles from within the dotfiles dir
#TODO: Check if this file exists and is a link to the dotfiles version
ln -s $(pwd)/zsh/.zprofile ~/.zprofile
ln -s $(pwd)/zsh/.zshrc ~/.zshrc
