#!/usr/bin/env fish

if test -e "$fish_function_path/fisher.fish"
    echo "Fisher already installed!"
else
    echo "Installing fisher..."
    curl https://git.io/fisher --create-dirs -sLo "$__fish_config_dir/functions/fisher.fish"
    echo "Fisher successfully installed!"
end

source "$__fish_config_dir/functions/fisher.fish"

# Install packages in fisher-packages.txt, but skip comment lines
fisher add (grep -v -x '#.*' ./fisher-packages.txt)
