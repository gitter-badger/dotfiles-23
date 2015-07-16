alias ctags="`brew --prefix`/bin/ctags"

alias dot='~/.dotfiles/';
alias cl=clear;

alias v='vim'

alias ga='git add .'
alias gc='git commit -m '
alias gl='git log'
alias gpu='git pull'
alias gps='git push'
alias gs='git status --short'
alias gl="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gd='git diff'

alias kmux="tmux ls | awk '{print $1}' | sed 's/://g' | xargs -I{} tmux kill-session -t {}"

alias nt="npm run test"
alias nr="npm run"
alias ni="npm install --save "
alias nid="npm install --save-dev"

alias eclimd='/Applications/eclipse/eclimd'

alias :q='exit'
echo 'Loading alias'
alias eclimd=/Applications/eclipse/eclimd

alias tags="find . -name '*.js' -print | xargs ctags"
