#bash_aliases                                                         
# my collection of bash aliases in one central location

# add the below to .bashrc if its not already there
#
# if [ -f ~/.bash_aliases ]; then
# . ~/.bash_aliases
# fi

# General aliases

alias updater="sudo apt update && sudo apt upgrade -y"
alias installer="sudo apt install -y"
alias uninstaller="sudo apt purge -y"
alias makerun="sudo chmod +x"
alias cleanup="sudo apt autoremove -y"
alias myname="hostname -I"
alias tempcheck="vcgencmd measure_temp"
alias checkip="iwgetid && ip -br addr"
alias status="systemctl status "
alias snano="sudo nano"
alias forget="sudo apt --purge autoremove -y"
alias basicmaint="sudo apt update && sudo apt upgrade -y && sudo apt clean && sudo apt autoremove -y "
alias ll="la -la"
alias basicmaintr="basicmaint && sudo reboot"

#network and Ip commands

alias myip="ip -br addr"
alias externalip="curl https://ipinfo.io/ip"
alias extip="dig +short myip.opendns.com @resolver1.opendns.com"
alias extipinfo="exip=$(curl https://ipinfo.io/ip) && curl https://ipinfo.io/$exip"
alias tcpcheck="sudo netstat -lpn | grep tcp"
alias udpcheck="sudo netstat -lpn | grep udp"


##docker related aliases

alias dps="docker ps"
alias dpsa="docker ps -a"
alias dsp="docker system prune"
alias dsvp="docker system prune && docker volume prune"
alias dsa="docker start $(docker ps -a -q)"
alias dstopa="docker kill $(docker ps -q)"
alias dra="docker restart $(docker ps -q)"
alias dcp="docker compose pull"
alias dcud="docker compose up -d"
alias dcu="docker compose up"
alias docker-compose="docker compose "
alias dcr="docker-compose restart"  #docker compose restart from folder with compose file
alias dcd="docker compose down"
alias dlog="docker logs  "
alias ndc="nano docker-compose.yml"

#container runs

alias portagent="docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent:latest"

# monitoring stuff using docker containers

alias glance="docker run --rm -v /var/run/docker.sock:/var/run/docker.sock:ro --pid host --network host -it nicolargo/glances:alpine-latest-full"
alias ctop="docker run --rm -ti --name=ctop -v /var/run/docker.sock:/var/run/docker.sock quay.io/vektorlab/ctop:latest"
alias dozlogs="docker run --rm --name dozzle-log-check --volume=/var/run/docker.sock:/var/run/docker.sock -p 8989:8080 amir20/dozzle:latest --no-analytics=true"

# quick tools

alias qfs="python3 -m http.server 4242 | tee access.log"

# system commands
alias pf="sudo shutdown -P now"
alias rbt="sudo reboot"

#ansible
alias anpin="ansible-playbook -i inventory/hosts"
alias anping="ansible all -m ping -v"

#update-stuff

# alias update-aliases="curl -o ~/.bash_aliases https://git.srlx.xyz/radpivm/setup-tools/raw/branch/main/bash/.bash_aliases && source ~/.bashrc"

