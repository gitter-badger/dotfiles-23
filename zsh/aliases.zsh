alias dot='~/.dotfiles/';
alias cl=clear;
alias flex='/web/flexible-content';
alias comp='/web/flexible-content/flexible-content-admin/src/main/webapp/static/composer';

alias v='vim'

alias ga='git add .'
alias gc='git commit -m '
alias gpu='git pull'
alias gps='git push'

alias kmux="tmux ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}"
