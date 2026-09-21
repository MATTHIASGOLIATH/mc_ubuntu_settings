# Ubuntu User Settings

This repository contains my Ubuntu development environment setup scripts.

## What's Included

- **Ghostty terminal** - Custom configuration with Catppuccin Frappe theme and UbuntuMono Nerd Font
- **LazyVim Neovim** - Starter template with catppuccin colorscheme and extensive extras
- **OpenCode** - AI coding assistant with llama.cpp provider (Qwen3.5 model)
- **Bash aliases** - Useful command shortcuts and safe variants for rm/mv/cp/ln
- **Bash prompt** - Custom PS1 configuration

## Installation

Run the installation script:

```bash
./install.sh
```

This script will:
1. Install OpenCode
2. Install Ghostty via snap
3. Copy Ghostty configuration
4. Copy OpenCode configuration
5. Copy LazyVim Neovim config (only if `~/.config/nvim/` doesn't exist)
6. Copy bash aliases and prompt
7. Replace `~/.bashrc` with custom configuration
8. Apply system-wide changes to `/etc/bash.bashrc`

## Post Installation

Start Ghostty to see your configured terminal.

## Configuration

### Ghostty
Check the `ghostty/` directory for configuration options.

### Neovim
The Neovim configuration is in `lazy_vim/`. To update an existing installation:

```bash
cp -r lazy_vim/ ~/.config/nvim/
```

### OpenCode
OpenCode configuration is in `opencode/`. To update an existing installation:

```bash
cp opencode/cli.json ~/.config/opencode/cli.json
cp opencode/opencode.json ~/.config/opencode/opencode.json
cp opencode/service.json ~/.config/opencode/service.json
```

### Bash
- Aliases: `bash/bash_aliases.d/`
- Prompt: `bash/bash_prompt`
- Bashrc: `bash/bashrc`

## Manual Ghostty Installation

Ghostty can be installed via snap (as used in this repo):

```bash
sudo snap install ghostty --classic
```

Or download the binary directly from the [official releases](https://github.com/ghostty-org/ghostty/releases).
