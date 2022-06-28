# Set dircolors
if [ -x /usr/bin/dircolors ] && [ -r ~/.dircolors ]; then
  eval "$(dircolors -b ~/.dircolors)"
else
  export LS_COLORS='rs=0:di=01;38;5;67:ln=01;38;5;220:mh=00:pi=40;33:so=01;38;5;139:do=01;38;5;139:bd=40;33;01:cd=40;33;01:or=40;31;01:su=37;41:sg=30;43:ca=30;41:tw=30;42:ow=34;42:st=37;44:ex=01;38;5;148:'
fi

# Set basic bash options
set -o vi
shopt -s dotglob
shopt -s extglob
shopt -s histappend
shopt -s checkwinsize

HISTSIZE=1000
HISTFILESIZE=2000

alias ll='ls -lah --color=auto --group-directories-first'

none="\[\e[0m\]"
cyber="\[\e[1;38;5;67m\]"
export PS1="${cyber}[\u@\s:\w]\$${none} "
