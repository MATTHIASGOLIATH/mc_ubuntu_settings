#!/bin/bash
set -e

# Constants: change these if they need changing
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
font="UbuntuMono"
nvim_pkgs=(neovim curl shellcheck tree-sitter-cli make gcc ripgrep fd-find unzip git xclip)

# Neovim setup
if dpkg -s "${nvim_pkgs[0]}" >/dev/null 2>&1; then
	echo "Neovim dependencies installed"
else
	echo "Installing Neovim dependencies"
	sudo add-apt-repository ppa:neovim-ppa/unstable -y
	sudo apt update
	sudo apt install curl shellcheck tree-sitter-cli make gcc ripgrep fd-find unzip git xclip neovim -y
fi

[[ -d "$config_dir/nvim/" ]] || cp -r nvim/ "$config_dir/nvim/"

# Ghostty setup
if [[ ! -d "/usr/share/fonts/${font,,}/" ]]; then
	sudo mkdir -p "/usr/share/fonts/${font,,}/"
	sudo curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.tar.xz" "/tmp/$font.tar.xz"
	sudo tar -xf "/tmp/$font.tar.xz" -C "/usr/share/fonts/${font,,}/"
	sudo fc-cache -fv
fi 
[[ -d "$config_dir/ghostty/" ]] || mkdir -p "$config_dir/ghostty/"
sudo snap install ghostty --classic
cp config.ghostty "$config_dir/ghostty/config.ghostty"

# Bash Aliases
sudo cat << EOF > ~/.bash_aliases
alias ssh='ghostty +ssh --'
alias neovim='nvim'
EOF

## TODO:
## - More bash_alias stuff
## - Probably more nvim stuff
