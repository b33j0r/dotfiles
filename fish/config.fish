set -gx PATH $HOME/bin $HOME/.pyenv/bin $HOME/.pyenv/shims /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin
set -gx PYENV_ROOT $HOME/.pyenv
set -gx EDITOR nvim

set -gx PYTHON2_VERSION (pyenv versions | grep '^\s*2' | tail -1 | tr -d '[:space:]')
set -gx PYTHON3_VERSION (pyenv versions | grep '^\s*3' | tail -1 | tr -d '[:space:]')

set -gx PYTHON2_BIN_DIR $PYENV_ROOT/versions/$PYTHON2_VERSION/bin
set -gx PYTHON3_BIN_DIR $PYENV_ROOT/versions/$PYTHON3_VERSION/bin

set -gx PYTHON2_BIN $PYTHON2_BIN_DIR/python 
set -gx PYTHON3_BIN $PYTHON3_BIN_DIR/python

set -gx SHELL /usr/local/bin/fish

if status --is-interactive

  source $HOME/.config/fish/interactive.fish
  source $HOME/.config/fish/keybindings.fish
  source $HOME/.config/fish/abbreviations.fish

end
