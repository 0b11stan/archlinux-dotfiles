alias grep="grep --color"
alias ls="ls --color=auto"
alias l="ls -l"
alias gst="git status"
alias gd="git diff"
alias gam="git commit -am"
alias detox="detox -s lower *"
alias tree="tree -C"

cdx() {cd $1; ls -l;}; alias cd="cdx"

alias voidfs="sudo mount 192.168.1.11:/srv/nfs/tristan /home/tristan/nfs"
alias setperformance="sudo cpupower frequency-set -g performance"
alias setpowersave="sudo cpupower frequency-set -g powersave"
alias backlight="sudo tee /sys/class/backlight/intel_backlight/brightness <<<"
alias meteo="curl http://wttr.in/"
alias temperature="curl http://v2.wttr.in/"
alias lf="find . -not -path '*/\.*' -type f"
alias hail="ls -hAil"
alias vim="nvim +NERDTree"
alias config="cd ~/repos/public/dotfiles && nvim +NERDTree install.sh"
alias syncaur="pushd ~/repos/perso/dotfiles/ && ./syncaur.sh && popd"
alias blackarchsearch="pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u | grep"
alias tmp="nvim ~/storage/private/TMP.txt"
alias todo="nvim ~/storage/private/TODO.txt"
alias toread="nvim ~/storage/private/TOREAD.txt"
alias towatch="nvim ~/storage/private/TOWATCH.txt"
alias cdsvpn="pushd ~/repos/cdiscount/docker-citrix && docker run --rm --privileged -it --network=host --env-file=config --name=citrix_vpn --volume=/etc/resolv.conf:/etc/resolv.conf docker-registry.cdweb.biz/sre/citrix:b4533cb"
alias screenshot='grim -g "$(slurp)" /tmp/$(date +screenshot-%s.png)'
#alias virsh="virsh --connect qemu:///system"
alias safeshutdown='voidpush && sudo pacman -Syu && shutdown now'

# ALIASES DOCKER
alias dockerstart="sudo systemctl start docker"
alias dockerstop="sudo systemctl stop docker"
alias dockerrestart="sudo systemctl restart docker"
alias dockerstatus="sudo systemctl status docker"
alias dcu="docker-compose up"
alias dcub="docker-compose up --build"
alias dcd="docker-compose down"
alias dcdv="docker-compose down --volumes"
alias dstopall='docker stop docker ps -a -q'
alias drmall='docker rm docker ps -a -q'
alias dgenocide="dstopall && drmall"
