# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=20000
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/freedick/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall
autoload -U colors && colors
export EDITOR=vim

function get_pwd() {
	echo "${PWD/$HOME/~}"
}
function get_time() {
	echo `date +%2H:%2M`
}
function get_ps1() {
	echo "$USER@%m:$(get_pwd)"
}
function get_ps2() {
	echo "$(get_time)"
}
function precmd() {
#echo -n "
PS1="%{$fg_bold[red]%}$USER%{$reset_color%}@%{$(python ~/dotfiles/colorgen.py $(hostname))%{$reset_color%}:%{$fg_bold[magenta]%}$(get_pwd)%{$reset_color%}
"
PS2="%{$fg[red]%}$(get_time)"
PS3="%{$fg_bold[magenta]%}> %{$reset_color%}"
PROMPT="$PS1$PS2$PS3"
}
#PROMPT="%{$(get_time)%} $fg[green]>$reset_color"
#
source ~/.bashrc
bindkey '^[[3~' delete-char
bindkey '^[[7~' beginning-of-line
bindkey '^[[8~' end-of-line

alias jme=". /usr/local/jmonkeyplatform/bin/jmonkeyplatform --jdkhome /opt/oracle-jdk-bin-1.8.0.74"
