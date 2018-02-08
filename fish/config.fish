set -gx PATH $HOME/bin $HOME/.pyenv/bin $HOME/.pyenv/shims /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin
set -gx PYENV_ROOT $HOME/.pyenv
set -gx EDITOR vim
set -gx SHELL fish

status --is-interactive; and source (pyenv init -|psub)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
