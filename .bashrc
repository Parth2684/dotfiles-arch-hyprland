#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return
fastfetch

alias ls='ls --color=auto'
alias grep='grep --color=auto'
PS1='[\u@\h \W]\$ '
[ -f /etc/bash.bashrc ] && source /etc/bash.bashrc
alias dotfiles='git --git-dir=$HOME/.dotfiles --work-tree=$HOME'
alias gdd='rclone copy --progress --drive-chunk-size 256M --transfers 1 --checkers 1 --retries 20 --low-level-retries 50 --partial-suffix .part'
alias sybaun='systemctl poweroff'
alias nigga='sudo'
alias hi='echo whad up gang'

export JAVA_HOME=/opt/android-studio/jbr
export ANDROID_HOME="$HOME/Android/Sdk"
export NDK_HOME="$ANDROID_HOME/ndk/$(ls -1 $ANDROID_HOME/ndk)"
export PATH=$PATH:$ANDROID_HOME/build-tools/34.0.0
export PATH=$PATH:$ANDROID_HOME/cmdline-tools/latest/bin

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
export PATH="$HOME/go/bin:$PATH"
alias config='/usr/bin/git --git-dir=/home/parth/.dotfiles --work-tree=/home/parth'
export PATH="$HOME/.cargo/bin:$PATH"

# Added by flyctl installer
export FLYCTL_INSTALL="/home/parth/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"
alias keys='/usr/bin/git --git-dir=$HOME/.keys/ --work-tree=$HOME'
