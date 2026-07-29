#!/bin/bash
set -e

# Ghostty setup
sudo snap install ghostty --classic
cat << EOF > ~/.config/ghostty/config.ghostty
# Catppuccin is an available theme from ghostty's defaults
theme = Catppuccin Frappe

# font adjustments
font-family = UbuntuMono Nerd Font
font-size = 15

# window adjustments
window-padding-x = 4
window-padding-y = 4
background-opacity = 0.99

# split keys
keybind = ctrl+shift+d=new_split:right
keybind = ctrl+shift+alt+d=new_split:down
keybind = ctrl+shift+enter=toggle_split_zoom

# navigation keys
keybind = ctrl+alt+h=goto_split:left
keybind = ctrl+alt+l=goto_split:right
keybind = ctrl+alt+j=goto_split:up
keybind = ctrl+alt+k=goto_split:down

# tab keys
keybind = ctrl+shift+t=new_tab
keybind = ctrl+shift+w=close_surface
keybind = ctrl+tab=next_tab
keybind = ctrl+shift+tab=previous_tab

# zoom keys
keybind = ctrl+plus=increase_font_size:1
keybind = ctrl+minus=decrease_font_size:1
keybind = ctrl+0=reset_font_size
EOF

## Bash Aliases
#cat << EOF > ~/.bash_aliases
#alias ssh='ghostty +ssh --'
#alias neovim='nvim'
#EOF

# Neovim setup
sudo add-apt-repository ppa:neovim-ppa/unstable -y
sudo apt update
sudo apt install shellcheck tree-sitter-cli make gcc ripgrep fd-find unzip git xclip neovim python3-pip -y
sudo snap install bash-language-server --classic
pip install pyright --break-system-packages
git clone https://github.com/MATTHIASGOLIATH/mc_kickstart.nvim.git "${XDG_CONFIG_HOME:-$HOME/.config}"/nvim
