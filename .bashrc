#
# ~/.bashrc
#

if [[ -d "$HOME/bin" ]]; then
	PATH="$HOME/bin:$PATH"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash history
export PROMPT_COMMAND='history -a'
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=8000

# PS1='[\u@\h \W]\$ '
PS1='\e[0;36m[\u@\h \W]\$ \e[m '

# source files
if [[ -f $HOME/.bash_aliases ]]; then
	source $HOME/.bash_aliases
fi

finish() {
	if [[ -f "$HOME/bin/uniqify.py" ]]; then
		python3 $HOME/bin/uniqify.py --infile=$HOME/.bash_history
	fi
}
trap finish EXIT
