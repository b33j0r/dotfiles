set -gx PATH /Users/bjorgensen/.pyenv/shims /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin

status --is-interactive; and source (pyenv init -|psub)

test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
