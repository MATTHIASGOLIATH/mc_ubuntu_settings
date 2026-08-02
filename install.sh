#!/bin/bash
set -x

# Constants: change these if they need changing
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
font="UbuntuMono"
nvim_pkgs=(neovim npm curl shellcheck make gcc ripgrep fd-find unzip git xclip)

# Cargo binstall setup
if [[ ! -d "$HOME/.cargo/bin" ]]; then
	mkdir -p "$HOME/.cargo/bin"
	curl -L --proto '=https' --tlsv1.2 -sSf https://raw.githubusercontent.com/cargo-bins/cargo-binstall/main/install-from-binstall-release.sh | bash
	export PATH=$PATH:$HOME/.cargo/bin
	cargo-binstall tree-sitter-cli
fi

# Neovim setup
if dpkg -s "${nvim_pkgs[@]}" >/dev/null 2>&1; then
	echo "Neovim dependencies installed"
else
	echo "Installing Neovim dependencies"
	sudo add-apt-repository ppa:neovim-ppa/unstable -y
	sudo apt update
	sudo apt install "${nvim_pkgs[@]}"
fi

[[ -d "$config_dir/nvim/" ]] || cp -r nvim/ "$config_dir/nvim/"

# Ghostty setup
if [[ ! -d "/usr/share/fonts/${font,,}/" ]]; then
	sudo mkdir -p "/usr/share/fonts/${font,,}/"
	sudo curl -OL "https://github.com/ryanoasis/nerd-fonts/releases/latest/download/$font.tar.xz"
	sudo mv $font "/tmp/$font.tar.xz"
	sudo tar -xf "/tmp/$font.tar.xz" -C "/usr/share/fonts/${font,,}/"
	sudo fc-cache -fv
fi 

if [[ ! -d "$config_dir/ghostty/" ]]; then
	mkdir -p "$config_dir/ghostty/"
	sudo snap install ghostty --classic
fi
# Update config regardless, it's cheap
cp ghostty/config.ghostty "$config_dir/ghostty/config.ghostty"

# Update editor regardless, it's cheap
sudo update-alternatives --set editor /usr/bin/nvim

# Bash Aliases
[[ -d "$HOME/.bash_aliases.d/" ]] || cp -r bash/bash_aliases.d "$HOME/.bash_aliases.d/"

# Bash Prompt
[[ -f "$HOME/.bash_prompt" ]] || cp bash/bash_prompt "$HOME/.bash_prompt"

# Replace bashrc
cp bash/bashrc "$HOME/.bashrc"
source "$HOME/.bashrc"

# Same with /etc/bash.bashrc
[[ -d "/etc/bash_aliases.d/" ]] || sudo cp -r bash_aliases.d "/etc/bash_aliases.d/"
[[ -f "/etc/bash_prompt" ]] || sudo cp bash_prompt "/etc/bash_prompt"
sudo sed -i "s#PS1=.*#,+1p,-1p'source /etc/bash_prompt'#" /etc/bash.bashrc

