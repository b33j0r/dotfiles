# I didn't like how this prefixes PATH (in particular, it was
# preventing applications from seeing a `python2` symlink)
set SAVED_PATH $PATH
source (pyenv init -|psub)
set -gx PATH $SAVED_PATH


test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish
