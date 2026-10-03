# configs
Repository where I keep my various configuration files.

## macOS

| Path | Installed to |
|---|---|
| `.gitconfig` | `~/.gitconfig` (SSH commit signing, `gh` credential helper) |
| `macos/.zshrc`, `.zshenv`, `.zprofile`, `.p10k.zsh` | `~/` (Oh My Zsh + Powerlevel10k, zoxide, nvm) |
| `macos/.config/nix/nix.conf` | `~/.config/nix/` (enables flakes) |
| `macos/.config/git/ignore` | `~/.config/git/` (global gitignore) |
| `macos/.config/ghostty/` | Ghostty terminal |
| `macos/.config/zed/` | Zed editor settings and keymap |
| `macos/.config/gh/config.yml` | GitHub CLI (`hosts.yml` holds the token and is never committed) |
| `macos/nix/packages.txt` | Packages in my Nix profile |

### Setup on a new Mac
1. Install [Nix](https://nixos.org/download/), then `macos/nix/install-packages.sh`
2. Install [Oh My Zsh](https://ohmyz.sh/#install)
3. `macos/install.sh --dry-run` to preview, then `macos/install.sh` to symlink everything
   (existing files are kept as `*.bak`)
4. Font: [Lilex Nerd Font](https://www.nerdfonts.com/font-downloads) (used by Zed and Powerlevel10k)
5. Toolchains, installed separately: [rustup](https://rustup.rs), [nvm](https://github.com/nvm-sh/nvm), [uv](https://docs.astral.sh/uv/)

## Windows
- `windows/packages.config`: Chocolatey packages (`choco install packages.config`)
- `windows/Microsoft.PowerShell_profile.ps1`: PowerShell profile (zoxide)
