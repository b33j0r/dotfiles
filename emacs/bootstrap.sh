#!/usr/bin/env bash

echo "BOOTSTRAP emacs"

BOOTSTRAP_HOME="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
pushd ${BOOTSTRAP_HOME}

# TODO: this feels weird
brew install aspell

brew install coreutils findutils
brew install gawk
brew install gnu-sed
brew install gnu-indent
# brew install gnutls
# brew install grep
# brew install gnu-tar

# TODO; use venv?
pip3 install importmagic epc

source install-emacs-head.sh
source install-spacemacs.sh


# TODO: find this dynamically
# tic -o ~/.terminfo /usr/local/Cellar/emacs-head/HEAD-1828e9a_1/share/emacs/27.0.50/etc/e/eterm-color.ti
#TERMINFO="/usr/local/Cellar/emacs-head/HEAD-1828e9a_1/share/emacs/27.0.50/etc"
#tic -o ~/.terminfo $TERMINFO/e/eterm-color.ti

popd
