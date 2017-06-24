############################## General ################################

# bin path in home directory
export PATH="$PATH:$HOME/bin"

# locale
export LANG=en_US.UTF-8

################################### Tmux ###################################################
export tmux_conf_new_window_retain_current_path=true

alias ls="ls -G"
################################### vim ###################################################
export EDITOR=nvim
alias vi="vim"
alias vim="nvim"
alias vimdiff="nvim -d"
#alias python2="python"

# tex
export PATH="$PATH:/Library/TeX/texbin"

# RUST 
export RUST_SRC_PATH="$HOME/.rust/src/src"
export PATH="$HOME/.cargo/bin:/usr/local/sbin:$PATH"

####JAVA

#export _JAVA_OPTIONS="-Xms1024m -Xmx2048m -XX:PermSize=256m -XX:MaxPermSize=1024m -XX:+UseParallelGC"
alias mcp="mvn clean package -Dmaven.test.skip"
alias mee="mvn eclipse:clean eclipse:eclipse"
alias mci="mvn clean install -Dmaven.test.skip"


############################### JavaScript ##########################
alias cnpm="npm --registry=https://registry.npm.taobao.org \
--cache=$HOME/.npm/.cache/cnpm \
--disturl=https://npm.taobao.org/dist \
--userconfig=$HOME/.cnpmrc"

alias esformatter="esformatter -c ~/.esformatter"

# go
export GOPATH="$HOME/.go"
export PATH="$GOPATH/bin:${PATH}"

# Network
#export ALL_PROXY="socks5://127.0.0.1:1080"

# python
#source ~/.python3/bin/activate
