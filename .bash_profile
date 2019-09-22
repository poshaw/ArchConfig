#
# ~/.bash_profile
#

[[ -f ~/.bashrc ]] && . ~/.bashrc

export EDITOR="nvim"
export TERMINAL="kitty"
export BROWSER="firefox"
export READER="zathura"

echo "$0" | grep "bash$" >/dev/null && [ -f ~/.bashrc ] && source "${HOME}/.bashrc"
