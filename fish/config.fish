set -gx JAVA_JVMS_HOME /Library/Java/JavaVirtualMachines
set -gx JAVA_JDK_VERSION (ls "$JAVA_JVMS_HOME" | sort | tail -1)
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/$JAVA_JDK_VERSION/Contents/Home
set -gx JAVA_PATH $JAVA_HOME/bin

set -gx PATH $HOME/.bin $HOME/bin /Library/Frameworks/Mono.framework/Versions/Current/bin $HOME/.pyenv/bin $HOME/.pyenv/shims $HOME/.cargo/bin /usr/local/bin /usr/local/sbin $JAVA_PATH /usr/bin /bin /usr/sbin /sbin

set -gx EDITOR nvim
set -gx VISUAL nvim

# TODO: should I learn improved ex mode?
# set -gx EDITOR nvim -E

set -gx PYENV_ROOT $HOME/.pyenv

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
  source $HOME/.config/fish/interactive.fish
  source $HOME/.config/fish/keybindings.fish
  source $HOME/.config/fish/abbreviations.fish
end
