### Settings
export EDITOR=/usr/local/bin/vim
export VISUAL=/usr/local/bin/vim
export TERM=xterm-256color
export TMUX_PLUGIN_MANAGER_PATH=~/.tmux/plugins/tpm

# Magic to view man pages in vim
#export PAGER="/bin/sh -c \"unset PAGER;col -b -x | \
#	vim -R -c 'set ft=man nomod nolist' -c 'map q :q<CR>' \
#	-c 'map <SPACE> <C-D>' -c 'map b <C-U>' \
#	-c 'nmap K :Man <C-R>=expand(\\\"<cword>\\\")<CR><CR>' -\""

# Apps
alias :q='exit'
alias v='vim'
alias vi='vim'

alias p3='python3'
alias py='python3'
alias py3='python3'

alias gitsync='git pull; git add .'

alias tx='tmuxinator'

# tmux
alias txas='tmux attach -t'
alias txls='tmux list-sessions'
alias txlw='tmux list-windows'
alias txks='tmux kill-session'

alias ns1='ssh -i $HOME/.ssh/ns1 opc@ns1'
alias ns2='ssh -i $HOME/.ssh/ns2 opc@ns2'

alias config='/usr/bin/git --git-dir=/home/undertaker/.cfg/ --work-tree=/home/undertaker'
