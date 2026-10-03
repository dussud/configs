#### Nix ####
export PATH="$HOME/.nix-profile/bin:$PATH"
export PATH="$PATH:/nix/var/nix/profiles/default/bin"
export LIBRARY_PATH="$HOME/.nix-profile/lib:$LIBRARY_PATH"

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

#### Oh My Zsh ####
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"
# zsh-syntax-highlighting and powerlevel10k live in $ZSH/custom, see install.sh
plugins=(git ssh uv zsh-syntax-highlighting)
source $ZSH/oh-my-zsh.sh

# Fix tmux font icons not working when ssh'ed
export LANG=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

#### PATH ####
export PATH="$HOME/.local/bin:$PATH"

#### Zoxide ####
eval "$(zoxide init zsh)"

#### Powerlevel10k ####
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

#### nvm ####
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"

#### Aliases ####
# make sudo work with aliases
alias sudo='sudo '

# Re-execute the last command and put its result into the clipboard
alias cl="fc -e -| pbcopy"

alias ipv4='dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com'
alias ipv6='dig -6 TXT +short o-o.myaddr.l.google.com @ns1.google.com'
alias localip='ipconfig getifaddr en0'
