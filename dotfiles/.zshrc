# The first zsh to run is tty1, we want it to start sway
if [[ "$(tty)" = "/dev/tty1" ]]; then
  #export WLR_RENDERER_ALLOW_SOFTWARE=1
  exec sway
fi

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load zsh plugins
for plug in $(cat ~/sources/0b11stan/dotfiles/src-zsh.txt ); do
  . /home/tristan/sources/$plug
done

# Load custom conf and aliases
source ~/.config/zsh/config.sh
source ~/.config/zsh/aliases.sh

# Enable autocompletion
autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
