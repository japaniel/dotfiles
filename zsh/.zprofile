# Enable autocomplete
autoload -U bashcompinit
bashcompinit

# Created by `pipx` on 2022-12-21 11:10:03
export PATH="$PATH:$HOME/.local/bin"
eval "$(register-python-argcomplete pipx)"


SSH_ENV="$HOME/.ssh/environment"

function start_agent {
  echo "Initialising new SSH agent..."
  (umask 066; /usr/bin/ssh-agent > "${SSH_ENV}")
  . "${SSH_ENV}" > /dev/null
  /usr/bin/ssh-add;
}

# Source SSH settings, if applicable

if [ -f "${SSH_ENV}" ]; then
  . "${SSH_ENV}" > /dev/null
  ps -ef | grep ${SSH_AGENT_PID} | grep ssh-agent$ > /dev/null || {
    start_agent;
  }
else
  start_agent;
fi
