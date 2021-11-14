# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load plugins
source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.plugin.zsh
source /usr/share/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh

# Load custom conf and aliases
source ~/.vars.sh || echo "File ~/.vars.sh not found"
source ~/.config/zsh/config.sh
source ~/.config/zsh/aliases.sh

# Enable autocompletion
autoload -Uz compinit && compinit

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

if [ "$(tty)" = "/dev/tty1" ]; then
  test $SELF_IS_VIRTUALIZED -eq 1 && export WLR_RENDERER_ALLOW_SOFTWARE=1
  exec sway
else
  source /usr/share/zsh-theme-powerlevel10k/powerlevel10k.zsh-theme
fi
