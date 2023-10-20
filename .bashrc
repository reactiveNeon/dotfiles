#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

alias ls='ls --color=auto'
alias ll='ls -la'
alias vscode="code --profile=linux"
alias grep='grep --color=auto'
alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'

PS1='[\u@\h \W]\$ '
. "$HOME/.cargo/env"
eval "$(starship init bash)"
source ~/.bash_completion/swww.bash
export DENO_INSTALL="/home/unrav/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"
export XDG_CONFIG_HOME="$HOME/.config"
