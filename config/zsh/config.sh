# common shit bro
export TERM="xterm-256color"
export EDITOR='nvim'
export BROWSER=/usr/bin/qutebrowser
export SAVEHIST=100000
export HISTSIZE=100000
export HISTFILE=~/.zsh_history

# enable screen sharing for webrtc
export XDG_SESSION_TYPE=wayland
export XDG_CURRENT_DESKTOP=sway

# cdiscount specific
export CMDB_HOST=https://jack.cdweb.biz
export CMDB_CLIENT_ID=youwhishyouknew
export CMDB_CLIENT_SECRET=butyoudont
export REQUESTS_CA_BUNDLE=/etc/ssl/certs/ca-certificates.crt

# for zsh command line editor (see man zshzle)
bindkey -M vicmd 'j' vi-backward-char
bindkey -M vicmd 'k' vi-down-line-or-history
bindkey -M vicmd 'l' vi-up-line-or-history
bindkey -M vicmd 'm' vi-forward-char
fzfhistory() {
  BUFFER=$(history 0 \
    | cut -c 8- \
    | sort -u \
    | fzf --tac \
          --reverse \
          --info=hidden \
          --height=10 \
          --bind=tab:down \
          --prompt='| ' \
  )
  zle end-of-line
}
zle -N fzfhistory fzfhistory
bindkey -M viins '^R' fzfhistory

# zsh autosuggestion
bindkey -M viins '^[[Z' autosuggest-accept
