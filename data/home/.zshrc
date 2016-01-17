############################## CUSTOMIZATION #############################
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:$HOME/bin"

# jenv
[[ -s "$HOME/.jenv/bin/jenv-init.sh" ]] && source "$HOME/.jenv/bin/jenv-init.sh" && source "$HOME/.jenv/commands/completion.sh"

####JAVA
export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"
export _JAVA_OPTIONS="-Xms1024m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=1024m -XX:+UseParallelGC"
export CATALINA_HOME=~/ali/pkg/taobao-tomcat
alias ls="ls -G"
alias vim="nvim"
alias vimdiff="nvim -d"
alias python2="python"
#alias vi="nvim"
alias mcp="mvn clean package -Dmaven.test.skip"
alias mee="mvn eclipse:clean eclipse:eclipse"
alias mci="mvn clean install -Dmaven.test.skip"


export EDITOR=vim

alias esformatter="esformatter -c ~/.esformatter"
export PATH="$HOME/.cargo/bin:/usr/local/sbin:$PATH"

export RUST_SRC_PATH="${HOME}/Documents/mine/rust/src/src"
