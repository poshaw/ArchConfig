#
# ~/.bashrc
#
# to reload .bashrc:
# $ source ~/.bashrc

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash history
export PROMPT_COMMAND='history -a'
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=8000

shopt -s histappend
shopt -s checkwinsize

# RGB colors for PS1
# for ideas check out: https://coolors.co/generate
C1='\[\e[38;2;184;161;101m\]'
C2='\[\e[38;2;150;165;120m\]'
C3='\[\e[38;2;146;181;150m\]'
C4='\[\e[38;2;115;145;150m\]'
C5='\[\e[38;2;184;186;204m\]'
RESET='\[$(tput sgr0)\]'
export PS1="\
${C4}\u\
${C2}@\
${C5}\h:\
${C2}[\
${C3}\w\
${C2}]\
\n\
${C1}\$ \
${RESET}"

export PS2="\
${C1}> \
${RESET}"

# use neovim for man pages
export MANPAGER='nvim +Man!'

# source files
if [[ -f $HOME/.bash_aliases ]]; then
	source $HOME/.bash_aliases
fi

if [[ -d ${HOME}/bin ]]; then
	PATH=${PATH}:${HOME}/bin
fi

# fix delete key for suckless st
printf '\033[?1h\033=' >/dev/tty

finish() {
	if [[ -f "$HOME/bin/uniqify.py" ]]; then
		# clean up .bash_history
		python ${HOME}/bin/uniqify.py --infile=${HOME}/.bash_history
		# push any changes to config files to github
		cd ${HOME}
		git commit -a -m "$(date +"%Y%m%d_%H%M")"
		git push -u origin master
	fi
}
trap finish EXIT

function ssh_function
{
    printf "\e[40m\e[37m"    # Grey on black
    clear
    \ssh $@ || read           # Actual ssh command
    printf "\e[0m"           # Reset terminal
    clear
}
