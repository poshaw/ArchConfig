#
# ~/.bash_logout
#

cd ${HOME}
git commit -1 -m "$(date +"%Y%m%d_%H%M")"
git push -u origin master
