# USER DEFINED CONFIGURATIONS

alias vi='vim'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'

alias documents='cd ~/Documents'
alias downloads='cd ~/Downloads'
alias pictures='cd ~/Pictures'
alias projects='cd ~/Projects'

alias ll='ls -l'
alias la='ls -la'
alias lh='ls -ld .*'
alias lt='ls -lat'

alias cp='cp -iv'
alias mv='mv -iv'
alias rm='rm -Iv'
alias mkdir='mkdir -pv'

alias psa='ps aux'
alias pss='ps aux | grep '

alias h='history | grep'
alias j='jobs -l'

alias df='df -h'
alias du='du -h'
alias free='free -h'

alias suspend='pm-suspend'
alias hibernate='pm-hibernate'
alias shutdown='shutdown -h now'

alias open ='gnome-open'

alias oops='sudo $(history -p \!\!)'

alias l='git log --oneline --graph'
alias d='git diff'
alias s='git status -s'
alias a='git add'
alias cm='git commit -m'
alias ci='git commit --interactive'
alias pom='git push origin master'

export HISTCONTROL=ignoreboth:erasedups

# Laptop Configurations

alias battery='upower -i /org/freedesktop/UPower/devices/battery_BAT0'
