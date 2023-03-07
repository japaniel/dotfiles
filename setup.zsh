# Run this script to setup the dotfiles from within the dotfiles dir
script_path=$(dirname $0)
#script=$(realpath -s $0)

if [ ! -L $HOME/.zprofile ]; then
  echo "Creating symlink to zprofile"
  ln -s $script_path/zsh/.zprofile ~/.zprofile
fi
if [ ! -L $HOME/.zshrc ]; then
  echo "Creating symlink to zsh"
  ln -s $script_path/zsh/.zshrc ~/.zshrc
fi

# TODO: install pyenv
# if [ ! $(which pyenv) && $(uname -s) == "Linux" ]; then
#   curl https://pyenv.run | bash
# fi

# TODO: install tfenv
