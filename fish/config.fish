set -gx LANG "en_US.UTF-8"
set -gx LC_COLLATE "en_US.UTF-8"
set -gx LC_CTYPE "UTF-8"
set -gx LC_MESSAGES "en_US.UTF-8"
set -gx LC_MONETARY "en_US.UTF-8"
set -gx LC_NUMERIC "en_US.UTF-8"
set -gx LC_TIME "en_US.UTF-8"
set -gx LC_ALL

set -gx JAVA_JVMS_HOME /Library/Java/JavaVirtualMachines
set -gx JAVA_JDK_VERSION (ls "$JAVA_JVMS_HOME" | sort | tail -1)
set -gx JAVA_HOME /Library/Java/JavaVirtualMachines/$JAVA_JDK_VERSION/Contents/Home
set -gx JAVA_PATH $JAVA_HOME/bin

set -gx GOPATH (go env GOPATH)

set -gx PATH $HOME/.bin $HOME/bin
set -gx PATH $PATH $HOME/.pyenv/bin $HOME/.pyenv/shims

set -gx PATH $PATH $HOME/.local/bin
set -gx PATH $PATH /usr/local/bin /usr/local/sbin
 
set -gx PATH $PATH $HOME/.cargo/bin

set -gx PATH $PATH $JAVA_PATH
set -gx PATH $PATH (go env GOPATH)/bin

set -gx PATH $PATH /usr/bin /bin /usr/sbin /sbin
# set -gx PATH $PATH /Library/Frameworks/Mono.framework/Versions/Current/bin

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

# emacs ansi-term support
if test -n "$EMACS"
  set -x TERM eterm-color
end

if status --is-interactive
  source $HOME/.config/fish/interactive.fish
  source $HOME/.config/fish/keybindings.fish
  source $HOME/.config/fish/abbreviations.fish
end
