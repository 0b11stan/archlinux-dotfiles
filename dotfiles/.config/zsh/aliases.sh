alias grep="grep --color"
alias ls="ls --color=auto"
alias l="ls -l"
alias gst="git status"
alias gd="git diff"
alias gam="git commit -am"
alias detox="detox -s lower *"
alias tree="tree -C"

cdx() {cd $1; ls -l;}; alias cd="cdx"
cve() {cat $(find /home/tristan/sources/public/cvelist -name "CVE-$1-$2.json") \
  | jq -r '.description.description_data | .[].value'}

alias voidfs="sudo mount -t cifs //192.168.1.11/tristan remote -o username=tristan,uid=1000,gid=1000"
alias setperformance="sudo cpupower frequency-set -g performance"
alias setpowersave="sudo cpupower frequency-set -g powersave"
alias backlight="sudo tee /sys/class/backlight/intel_backlight/brightness <<<"
alias meteo="curl http://wttr.in/"
alias temperature="curl http://v2.wttr.in/"
alias lf="find . -not -path '*/\.*' -type f"
alias hail="ls -hAil"
alias vim="nvim +NERDTree"
alias config="cd ~/sources/public/dotfiles && nvim +NERDTree install.sh"
alias syncaur="pushd ~/sources/perso/dotfiles/ && ./syncaur.sh && popd"
alias blackarchsearch="pacman -Sgg | grep blackarch | cut -d' ' -f2 | sort -u | grep"
alias tmp="nvim ~/remote/TMP.txt"
alias todo="nvim ~/remote/TODO.txt"
alias toread="nvim ~/remote/TOREAD.txt"
alias towatch="nvim ~/remote/TOWATCH.txt"
alias cdsvpn="pushd ~/sources/cdiscount/docker-citrix && docker run --rm --privileged -it --network=host --env-file=config --name=citrix_vpn --volume=/etc/resolv.conf:/etc/resolv.conf docker-registry.cdweb.biz/sre/citrix:b4533cb"
alias screenshot='grim -g "$(slurp)" /tmp/$(date +screenshot-%s.png)'
#alias virsh="virsh --connect qemu:///system"
alias safeshutdown='voidpush && sudo pacman -Syu && shutdown now'
alias msum="grep '^#[#]* '" # markdown summary

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

alias cme="podman run -it --rm --entrypoint /usr/local/bin/cme --volume ~/.config/crackmapexec:/root/.cme docker.io/byt3bl33d3r/crackmapexec"
# podman build -t searchsploit -f searchsploit.dockerfile
alias searchsploit="podman run --entrypoint /usr/bin/searchsploit searchsploit"
alias fuzzjq="jq -r '.results | .[] | .input.FUZZ'"
