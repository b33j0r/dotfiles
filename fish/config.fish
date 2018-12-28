if status --is-interactive
  source $HOME/.config/fish/interactive.fish
end

set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/jdk1.8.0_192.jdk/Contents/Home
set -gx JAVA_PATH $JAVA_HOME/bin

set -gx PATH $HOME/.bin $HOME/bin /Library/Frameworks/Mono.framework/Versions/5.4.1/bin $HOME/.pyenv/bin $HOME/.pyenv/shims $HOME/.cargo/bin /usr/local/bin /usr/local/sbin $JAVA_PATH /usr/bin /bin /usr/sbin /sbin
set -gx PYENV_ROOT $HOME/.pyenv
set -gx EDITOR nvim

set -gx PYTHON2_VERSION (pyenv versions | grep -Eo "^\*?\s*2\.\d+\.\d+\b" | cut -c 3- |  tail -1 | tr -d '[:space:]')
set -gx PYTHON3_VERSION (pyenv versions | grep -Eo "^\*?\s*3\.\d+\.\d+\b" | cut -c 3- |  tail -1 | tr -d '[:space:]')

set -gx PYTHON2_BIN_DIR $PYENV_ROOT/versions/$PYTHON2_VERSION/bin
set -gx PYTHON3_BIN_DIR $PYENV_ROOT/versions/$PYTHON3_VERSION/bin

set -gx PYTHON2_BIN $PYTHON2_BIN_DIR/python 
set -gx PYTHON3_BIN $PYTHON3_BIN_DIR/python

set -gx SRC_PREFIX $HOME/.src
set -gx RUST_VERSION (rustc --version | cut -c 7-)
# set -gx RUST_SRC_PATH $SRC_PREFIX/rust-$RUST_VERSION
set -gx RUST_SRC_PATH $SRC_PREFIX/rust/src
set -gx RACER_BIN $HOME/.cargo/bin/racer

set -gx SHELL /usr/local/bin/fish

if status --is-interactive
  source $HOME/.config/fish/keybindings.fish
  source $HOME/.config/fish/abbreviations.fish
end

