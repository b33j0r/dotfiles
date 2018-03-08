set -gx PATH $HOME/bin $HOME/.pyenv/bin $HOME/.pyenv/shims /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin
set -gx PYENV_ROOT $HOME/.pyenv
set -gx EDITOR vim

set -gx PYTHON2_VERSION (pyenv versions | grep '^\s*2' | tail -1 | tr -d '[:space:]')
set -gx PYTHON3_VERSION (pyenv versions | grep '^\s*3' | tail -1 | tr -d '[:space:]')

set -gx PYTHON2_BIN_DIR $PYENV_ROOT/versions/$PYTHON2_VERSION/bin
set -gx PYTHON3_BIN_DIR $PYENV_ROOT/versions/$PYTHON3_VERSION/bin

set -gx PYTHON2_BIN $PYTHON2_BIN_DIR/python 
set -gx PYTHON3_BIN $PYTHON3_BIN_DIR/python

set -gx SHELL /usr/local/bin/fish

if status --is-interactive

  source (pyenv init -|psub)
  test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

end
