export RUST_SRC_PATH="$HOME/.rust/src/src"
############################## CUSTOMIZATION #############################
export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/Library/TeX/texbin:$HOME/bin:$PATH"

export EDITOR=nvim

# jenv
# homebrew installed version
export JENV_ROOT=/usr/local/var/jenv
if which jenv > /dev/null; then eval "$(jenv init -)"; fi
# directly installed by scripts
[[ -s "$HOME/.jenv/bin/jenv-init.sh" ]] && source "$HOME/.jenv/bin/jenv-init.sh" && source "$HOME/.jenv/commands/completion.sh"
export PATH="$HOME/.jenv/bin:$PATH"

####JAVA
#export JAVA_HOME=$(/usr/libexec/java_home)
#export JAVA_HOME="/Library/Java/JavaVirtualMachines/jdk1.7.0_79.jdk/Contents/Home"
#export _JAVA_OPTIONS="-Xms1024m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=1024m -XX:+UseParallelGC"
export CATALINA_HOME=~/ali/pkg/taobao-tomcat
function setjdk() {
  if [ $# -ne 0 ]; then
   removeFromPath '/System/Library/Frameworks/JavaVM.framework/Home/bin'
   if [ -n "${JAVA_HOME+x}" ]; then
    removeFromPath $JAVA_HOME
   fi
   export JAVA_HOME=`/usr/libexec/java_home -v $@`
   export PATH=$JAVA_HOME/bin:$PATH
  fi
 }
 function removeFromPath() {
  export PATH=$(echo $PATH | sed -E -e "s;:$1;;" -e "s;$1:?;;")
 }
#setjdk 1.8

alias ls="ls -G"

alias vi="vim"
alias vim="nvim"
alias vimdiff="nvim -d"
#alias python2="python"
alias mcp="mvn clean package -Dmaven.test.skip"
alias mee="mvn eclipse:clean eclipse:eclipse"
alias mci="mvn clean install -Dmaven.test.skip"

alias esformatter="esformatter -c ~/.esformatter"
export PATH="$HOME/.cargo/bin:/usr/local/sbin:$PATH"

# JAVA
export CLASSPATH=".:/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH"
alias antlr4='java -jar /usr/local/lib/antlr-4.5.3-complete.jar'
alias grun='java org.antlr.v4.gui.TestRig'

# android
export ANDROID_HOME="/usr/local/Cellar/android-sdk/24.4.1_1"


# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:${PATH}"

# npm
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

# alias npm="cnpm"

# Network
#export ALL_PROXY="socks5://127.0.0.1:1080"

# python
source ~/.python3/bin/activate
