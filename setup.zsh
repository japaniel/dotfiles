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

# Setup vim configuration
if [ ! -L $HOME/.vimrc ]; then
  echo "Creating symlink to vimrc"
  ln -s $script_path/vim/.vimrc ~/.vimrc
fi

if [ ! -L $HOME/.vim ] && [ -d $script_path/vim/.vim ]; then
  # Remove existing .vim directory if it's not a symlink and create symlink
  if [ -d $HOME/.vim ]; then
    echo "Backing up existing .vim directory"
    mv $HOME/.vim $HOME/.vim.backup
  fi
  echo "Creating symlink to vim directory"
  ln -s $script_path/vim/.vim ~/.vim
fi

# Install Oh My Zsh plugins if they don't exist
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-autosuggestions" ]; then
  echo "Installing zsh-autosuggestions plugin..."
  git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
fi

if [ ! -d "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting" ]; then
  echo "Installing zsh-syntax-highlighting plugin..."
  git clone https://github.com/zsh-users/zsh-syntax-highlighting.git $ZSH_CUSTOM/plugins/zsh-syntax-highlighting
fi
