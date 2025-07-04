# .zprofile - Login shell configuration only
# This file is sourced only for login shells (when you first log in)

# SSH Agent Configuration
SSH_ENV="$HOME/.ssh/environment"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi

# Add key if not already added
ssh-add -l | grep -q "$(ssh-keygen -lf ~/.ssh/arc.id_rsa | awk '{print $2}')" || ssh-add ~/.ssh/arc.id_rsa

# Note: All PATH and development environment settings are now in .zshrc
