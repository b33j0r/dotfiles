#!/usr/bin/env bash

echo "BOOTSTRAP nvim"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

rm -rf $HOME/.config/nvim
mkdir -p $HOME/.config/nvim

# pyenv must have already been installed

PYENV_VERSION_2="$(pyenv versions | grep '^\s*2' | tail -1 | tr -d '[:space:]')"
PYENV_VERSION_3="$(pyenv versions | grep '^\s*3' | tail -1 | tr -d '[:space:]')"

PYENV_VERSIONS_DIR="$HOME/.pyenv/versions"

PYTHON_DIR_2="${PYENV_VERSIONS_DIR}/${PYENV_VERSION_2}"
PYTHON_DIR_3="${PYENV_VERSIONS_DIR}/${PYENV_VERSION_3}"

PYTHON_BIN_2="${PYTHON_DIR_2}/bin/python"
PYTHON_BIN_3="${PYTHON_DIR_3}/bin/python"

bash -c "${PYTHON_DIR_2}/bin/pip install neovim"
bash -c "${PYTHON_DIR_3}/bin/pip install neovim"

brew install neovim >> /dev/null
brew upgrade neovim

if [ ! -e "$HOME/.local/share/nvim/site/autoload/plug.vim" ]; then
  echo "Installing vim-plug for neovim"

  curl -fLo $HOME/.local/share/nvim/site/autoload/plug.vim --create-dirs \
      https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
else
  echo "vim-plug already installed!"
fi

ln -s -f ${BOOTSTRAP_HOME}/init.vim ${HOME}/.config/nvim/init.vim

git clone https://github.com/Xuyuanp/nerdtree-git-plugin.git ~/.vim/bundle/nerdtree-git-plugin


popd
