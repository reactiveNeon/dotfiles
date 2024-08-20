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

## source all bash completions
COMPLETIONS_DIR="$HOME/.bash_completions"
for cfile in "$COMPLETIONS_DIR"/*; do
    if [[ -r "$cfile" && ! -d "$cfile" ]]; then
        source "$cfile"
    fi
done

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

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH=$BUN_INSTALL/bin:$PATH

export PATH=$PATH:/home/unrav/.spicetify

# >>> juliaup initialize >>>

# !! Contents within this block are managed by juliaup !!

case ":$PATH:" in
    *:/home/unrav/.juliaup/bin:*)
        ;;

    *)
        export PATH=/home/unrav/.juliaup/bin${PATH:+:${PATH}}
        ;;
esac

# <<< juliaup initialize <<<

export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

### THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

