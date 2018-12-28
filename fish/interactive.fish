set -gx PATH $HOME/.pyenv/bin $PATH

source (pyenv init -|psub)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
