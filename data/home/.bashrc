#!/bin/bash
#THIS MUST BE AT THE END OF THE FILE FOR JENV TO WORK!!!
[[ -s "/Users/Alex/.jenv/bin/jenv-init.sh" ]] && source "/Users/Alex/.jenv/bin/jenv-init.sh" && source "/Users/Alex/.jenv/commands/completion.sh"

# customization
export PATH=$PATH:~/bin
export PS1="\[\033[36m\]\u\[\033[m\]@\[\033[32m\]\h:\[\033[33;1m\]\w\n\t\[\033[m\]\$ "
####JAVA
export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"
export _JAVA_OPTIONS="-Xms1024m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=1024m -XX:+UseParallelGC"
export CATALINA_HOME=~/ali/pkg/taobao-tomcat
alias ls="ls -G"
alias la="ls -G -a"
alias vim="nvim"
alias vi="vim"

export EDITOR=vim
export TERM="screen-256color"

export NVM_DIR="/Users/Alex/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && . "$NVM_DIR/nvm.sh"  # This loads nvm

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/Alex/.sdkman"
[[ -s "/Users/Alex/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/Alex/.sdkman/bin/sdkman-init.sh"
