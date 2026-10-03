#!/bin/zsh
# Symlinks the macOS dotfiles from this repo into $HOME.
# Existing files are moved to <file>.bak before linking.
# Usage: ./install.sh [--dry-run]
set -eu
MACOS="${0:A:h}"
REPO="${MACOS:h}"
DRY=${1:-}

link() {
  local src=$1 dst=$2
  if [[ -L $dst && ${dst:A} == ${src:A} ]]; then
    echo "ok       $dst"; return
  fi
  if [[ -n $DRY ]]; then echo "would    $dst -> $src"; return; fi
  mkdir -p "${dst:h}"
  [[ -e $dst || -L $dst ]] && mv "$dst" "$dst.bak" && echo "backup   $dst.bak"
  ln -s "$src" "$dst" && echo "linked   $dst"
}

link "$REPO/.gitconfig" ~/.gitconfig
for f in .zshrc .zshenv .zprofile .p10k.zsh; do
  link "$MACOS/$f" ~/$f
done
for f in nix/nix.conf git/ignore ghostty/config.ghostty zed/settings.json zed/keymap.json gh/config.yml; do
  link "$MACOS/.config/$f" ~/.config/$f
done

# Oh My Zsh custom theme and plugin
[[ -n $DRY ]] && exit 0
ZSH_CUSTOM=${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}
if [[ -d ~/.oh-my-zsh ]]; then
  [[ -d $ZSH_CUSTOM/themes/powerlevel10k ]] || git clone --depth=1 https://github.com/romkatv/powerlevel10k.git "$ZSH_CUSTOM/themes/powerlevel10k"
  [[ -d $ZSH_CUSTOM/plugins/zsh-syntax-highlighting ]] || git clone --depth=1 https://github.com/zsh-users/zsh-syntax-highlighting.git "$ZSH_CUSTOM/plugins/zsh-syntax-highlighting"
else
  echo "Oh My Zsh not installed: https://ohmyz.sh/#install"
fi
