#
# ~/.bashrc
#

if [[ -d "$HOME/bin" ]]; then
	PATH="$HOME/bin:$PATH"
fi
# if [[ -d "$HOME/.local/lib/python3.7/site-packages/django/bin" ]]; then
# 	PATH="$PATH:$HOME/.local/lib/python3.7/site-packages/django/bin"
# fi
if [[ -d $HOME/.local/bin ]]; then
	PATH="$PATH:$HOME/.local/bin"
fi

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

# bash history
export PROMPT_COMMAND='history -a'
HISTCONTROL=ignoreboth
HISTSIZE=5000
HISTFILESIZE=8000

# prompt
PS1="\[\e[1;36m\] \u\[\e[0;33m\]@\[\e[0;32m\]\h \[\e[0;34m\]\W/ \[\e[0;33m\]\$\[\e[0m\] "

# use neovim for man pages
export MANPAGER='nvim +Man!'

# source files
if [[ -f $HOME/.bash_aliases ]]; then
	source $HOME/.bash_aliases
fi

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
