# Nodejs
VERSION=v16.1.0
DISTRO=linux-x64
export PATH=/usr/local/lib/nodejs/node-v16.1.0-linux-x64/bin:$PATH

# pyenv: https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Copy the below line to ~/.zshrc:
# eval "$(pyenv init -)"