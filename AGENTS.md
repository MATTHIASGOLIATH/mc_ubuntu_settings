# Ubuntu Settings Agent Guide

## Repository Purpose
This repo contains user setup scripts for Ubuntu: Ghostty terminal, LazyVim Neovim, bash aliases, and OpenCode configuration.

## Installation
Run `./install.sh` to apply all settings. This script:
1. Downloads and installs OpenCode
2. Downloads and installs Ghostty via snap
3. Copies Ghostty config from `ghostty/config.ghostty`
4. Copies OpenCode config from `opencode/` to `~/.config/opencode/`
5. Copies LazyVim from `lazy_vim/` to `~/.config/nvim/` (only if `~/.config/nvim/` doesn't exist)
6. Copies bash aliases from `bash/bash_aliases.d/` to `~/.bash_aliases.d/`
7. Copies prompt from `bash/bash_prompt` to `~/.bash_prompt`
8. Replaces `~/.bashrc` with `bash/bashrc`
9. Also applies changes system-wide to `/etc/bash.bashrc`

## Directory Ownership
| Directory | Purpose |
|-----------|---------|
| `ghostty/` | Ghostty terminal configuration |
| `lazy_vim/` | LazyVim Neovim starter template |
| `bash/` | Bash aliases, prompt, bashrc |
| `opencode/` | OpenCode CLI and provider configuration |

## Bash Aliases
Located in `bash/bash_aliases.d/bash_aliases`. Key aliases:
- `ll` → `ls -alhF --color=auto`
- `lt` → `ls --human-readable --size -1 -S` (longest file)
- `gh` → `history|grep`
- `rm`, `mv`, `cp`, `ln` → safe variants with prompts

## Ghostty Config
Theme: Catppuccin Frappe
Font: UbuntuMono Nerd Font (15pt)
Splits: `Ctrl+Shift+F` (horizontal), `Ctrl+Shift+D` (vertical)
Tabs: `Ctrl+Shift+T` (new), `Ctrl+Shift+W` (close)

## Neovim
Uses LazyVim with lazy.nvim plugin manager.
Default colorscheme: catppuccin

### Custom Plugins
Configured in `lazy_vim/lua/plugins/example.lua`. Key customizations:
- Colorscheme: catppuccin
- Coding extras: yanky, inc-rename
- Language extras: ansible, docker, git, go, helm, json, markdown, python, r, sql, terraform, toml, yaml
- UI extras: smear-cursor, treesitter-context
- Utility extras: dot, mini-hipatterns, project
- Core plugins: blink.cmp, conform.nvim, gitsigns.nvim, grug-far.nvim, helm-ls.nvim, lualine.nvim, markdown-preview.nvim, mason.nvim, mini.pairs, noice.nvim, nvim-lspconfig, nvim-treesitter, nvim-treesitter-textobjects, nvim-treesitter-context, nvim-ts-autotag, plenary.nvim, project.nvim, render-markdown.nvim, snacks.nvim, todo-comments.nvim, vim-dadbod, which-key.nvim, yanky.nvim

### Styling
Lua formatting uses `stylua` with:
- 2-space indent
- 120 column width

## OpenCode
OpenCode is installed via official script and configured with the following settings:

### CLI Settings (`opencode/cli.json`)
- Theme: Catppuccin Frappe (with system mode)
- Animations: enabled
- Session: scrollbar disabled, thinking shown, markdown rendered, TPS enabled
- Tabs: enabled with horizontal layout and status indicators
- Diff viewing: auto with word wrap
- Prompt: full paste, image preview enabled
- Attention: notifications and sound enabled
- Terminal: title enabled, copy on select

### Provider Configuration (`opencode/opencode.json`)
- Enabled provider: llama.cpp
- Model: Qwen3.5 (unsloth/Qwen3.5-9B-GGUF:Q4_K_XL)
- Base URL: http://127.0.0.1:9092/v1
