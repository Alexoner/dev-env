ps -ef |grep appName |grep -v grep |awk '{print $2}' # print process id given appName
netstat -nlptu # list Listening Ports, including TCP, UDP processes, in Numeric format
lsof -i -p pid # list opened files, including Internet addresses
lsof -i :7001 # find processes opened port 7001
netstat -na # -a(--all) show both listening and non-listening sockets

sudo -S ls # read password from stdin, instead of terminal device

########################### TEXT PROCESSING #########################
cat f.txt |sort |uniq -c
cat aicloud.log |grep device_want_to |sort |egrep -o '\[[0-9a-f]+\]' |uniq -c |wc -l

# statistics
cat data.log | grep "dd hh:m" |egrep -o '"eventName": "[^"]+"' |sort |uniq -c |sort
