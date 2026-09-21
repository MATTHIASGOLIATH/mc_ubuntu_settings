#!/bin/bash

# Constants: change these if they need changing
config_dir="${XDG_CONFIG_HOME:-$HOME/.config}"
font="UbuntuMono"

# OpenCode setup
if [[ ! -d "$HOME/.opencode/bin" ]]; then
  mkdir -p "$HOME/.opencode/bin"
  curl -fsSL https://opencode.ai/install | bash
fi

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

# Update opencode config
[[ -d "$config_dir/opencode/" ]] || mkdir -p "$config_dir/opencode/"
cp opencode/cli.json "$config_dir/opencode/cli.json"
cp opencode/opencode.json "$config_dir/opencode/opencode.json"

# Update nvim config (only if ~/.config/nvim/ doesn't exist)
[[ -d "$HOME/.config/nvim/" ]] || cp -r lazy_vim/ "$HOME/.config/nvim/"

# Bash Aliases
[[ -d "$HOME/.bash_aliases.d/" ]] || cp -r bash/bash_aliases.d "$HOME/.bash_aliases.d/"

# Bash Prompt
[[ -f "$HOME/.bash_prompt" ]] || cp bash/bash_prompt "$HOME/.bash_prompt"

# Replace bashrc
cp bash/bashrc "$HOME/.bashrc"
source "$HOME/.bashrc"

# Same with /etc/bash.bashrc
[[ -d "/etc/bash_aliases.d/" ]] || sudo cp -r bash/bash_aliases.d "/etc/bash_aliases.d/"
[[ -f "/etc/bash_prompt" ]] || sudo cp bash/bash_prompt "/etc/bash_prompt"
sudo sed -i "s#PS1=.*#,+1p,-1p'source /etc/bash_prompt'#" /etc/bash.bashrc
