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

### Deno Path
export DENO_INSTALL="/home/unrav/.deno"
export PATH="$DENO_INSTALL/bin:$PATH"

### Flutter Path
export PATH=/home/unrav/development/flutter/bin:$PATH
export PATH="$PATH":"$HOME/.pub-cache/bin"

export XDG_CONFIG_HOME="$HOME/.config"

# export ANDROID_HOME=$HOME/android-sdk
# export ANDROID_HOME=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_HOME/platform-tools
# export JAVA_HOME=/usr/lib/jvm/java-21-openjdk

### THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"
