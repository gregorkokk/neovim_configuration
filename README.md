# Minimal Neovim Configuration

A clean, minimal Neovim setup focused on Python and C++ development with modern features including LSP integration, autocompletion, and file navigation.

## Features

- **Catppuccin Theme** - Beautiful dark colorscheme with the frappe variant
- **Telescope** - Fuzzy finder for files, grep, and more
- **Neo-tree** - File explorer with a modern UI
- **Oil.nvim** - Edit your filesystem like a buffer
- **LSP Integration** - Code intelligence with:
  - Jedi Language Server for Python
  - Lua Language Server for Lua
  - clangd for C/C++
- **Debugging** - nvim-dap with a debug UI and inline variable values:
  - codelldb for C/C++
  - debugpy for Python (runs your code in the nearest `.venv`)
- **Autocompletion** - Smart completion with nvim-cmp
- **Treesitter** - Enhanced syntax highlighting for multiple languages
- **Lazy.nvim** - Plugin management with lazy-loading
- **Autopairs** - Automatic insertion of closing pairs

## Installation

### Prerequisites

- Neovim version 0.10.0 or higher
- Git
- A nerdfont for proper icons (optional but recommended)

### Setup

1. Clone this configuration to your Neovim config directory:

```bash
# Make sure your config directory exists
mkdir -p ~/.config/nvim

# Navigate to the config directory
cd ~/.config

# Clone the repository
git clone https://github.com/gregorkokk/neovim_configuration
```

2. Start Neovim - Lazy.nvim will automatically install on first launch:

```bash
nvim
```

## Keyboard Shortcuts

### General

- `Space` - Leader key
- `Ctrl+h/j/k/l` - Navigate between split windows
- `Space+h` - Clear search highlighting

### File Navigation

- `Ctrl+n` - Toggle file explorer (Neo-tree)
- `Ctrl+p` - Find files with Telescope
- `Space+fg` - Live grep search with Telescope
- `Space+Space` - Recently opened files
- `-` - Toggle Oil.nvim file manager in float mode
- `Space+bf` - Show buffers in Neo-tree

### LSP Features

- `K` - Show hover documentation
- `Space+gd` - Go to definition
- `Space+gr` - Show references
- `Space+gf` - Format current buffer
- `Space+ca` - Code actions
- `Space+rn` - Rename symbol

### Debugging

- `Space+dc` - Start / continue
- `Space+dn` - Step over
- `Space+di` - Step into
- `Space+do` - Step out
- `Space+db` - Toggle breakpoint
- `Space+dB` - Conditional breakpoint
- `Space+dr` - Open REPL
- `Space+du` - Toggle debug UI
- `Space+dt` - Terminate session

The debug UI opens and closes automatically with each session. For C/C++, compile with `-g` and give the path to the binary when asked.

## Editor Behavior

- **No automatic comment continuation** - Pressing `Enter` (or `o`/`O`) on a `//` comment line gives a clean new line instead of inserting another `//`. This is done with a `FileType` autocmd in `vim-options.lua`, because filetype plugins (e.g. C++) turn the `r` and `o` flags of `formatoptions` back on after `init.lua` runs.

## Language Support

This configuration includes built-in support for:

- Python (via Jedi Language Server)
- Lua
- C++
- CSV
- CUDA
- Makefiles

Additional language servers can be installed via Mason (`:Mason` command).

## Customization

- Edit `vim-options.lua` to change basic Vim settings
- Add new plugins by creating files in `~/.config/nvim/lua/plugins/`
- Modify LSP settings in `lsp-config.lua`

## Troubleshooting

If you encounter issues:

1. Run `:checkhealth` to diagnose problems
2. Ensure all dependencies are installed
3. Check that language servers are properly installed (`:Mason`)

## Credit

This configuration uses [Lazy.nvim](https://github.com/folke/lazy.nvim) for plugin management.
This configuration is implemented using [Typecraft Dev](https://github.com/typecraft-dev) configuration.
