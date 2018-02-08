#!/usr/bin/env bash

echo "BOOTSTRAP tmux"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

brew bundle


# .tmux

brew tap caskroom/fonts
brew cask install font-source-code-pro >> /dev/null 2>&1

if [ ! -e "$HOME/.tmux" ]; then
  echo "Installing .tmux"
  git clone https://github.com/gpakosz/.tmux.git $HOME/.tmux
else
  echo ".tmux already installed!"
fi

pushd $HOME/.tmux
git pull
popd


# tmuxinator

gem install tmuxinator

mkdir -p $HOME/.config/fish/completions/
mkdir -p $HOME/.config/tmuxinator/

# pushd $HOME/.config/fish/completions
# wget https://raw.githubusercontent.com/tmuxinator/tmuxinator/master/completion/tmuxinator.fish
# popd

ln -s -f $BOOTSTRAP_HOME/fish/completions/tmuxinator.fish $HOME/.config/fish/completions/tmuxinator.fish

ln -s -f $BOOTSTRAP_HOME/tmuxinator/* $HOME/.config/tmuxinator/

# Test
tmuxinator doctor

# Link conf files

ln -s -f $HOME/.tmux/.tmux.conf $HOME/.tmux.conf
ln -s -f ${BOOTSTRAP_HOME}/tmux.conf.local $HOME/.tmux.conf.local

popd
