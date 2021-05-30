# pyenv: https://github.com/pyenv/pyenv
export PYENV_ROOT="$HOME/.pyenv"
export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init --path)"

# Copy the below line to ~/.zshrc:
# eval "$(pyenv init -)"