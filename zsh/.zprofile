# Created by `pipx` on 2022-12-21 11:10:03
export PATH="$PATH:$HOME/.local/bin"

SSH_ENV="$HOME/.ssh/environment"

if ! pgrep -u "$USER" ssh-agent > /dev/null; then
  eval "$(ssh-agent -s)"
fi

# Add key if not already added
ssh-add -l | grep -q "$(ssh-keygen -lf ~/.ssh/arc.id_rsa | awk '{print $2}')" || ssh-add ~/.ssh/arc.id_rsa