set -gx PATH $HOME/bin $HOME/.pyenv/bin $HOME/.pyenv/shims /usr/local/bin /usr/local/sbin /usr/bin /bin /usr/sbin /sbin
set -gx PYENV_ROOT $HOME/.pyenv
set -gx EDITOR vim

## this [indirectly, probably upstream] breaks ssh ProxyJump/ProxyCommand
set -gx SHELL /usr/local/bin/fish

## this last part was suspect after I learned of the nature of the problem,
## but turns out to not matter. can be commented, deleted, unguarded...
## no effect on any of the behaviors described in this issue

if status --is-interactive

  source (pyenv init -|psub)
  test -e {$HOME}/.iterm2_shell_integration.fish ; and source {$HOME}/.iterm2_shell_integration.fish

end
