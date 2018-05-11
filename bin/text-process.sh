#!/bin/sh

########################### SED #######################################

# substitute substring
sed 's/pattern/target/g' # s for substitute, g for global
sed -i 's/pattern/target/g' # s for substitute, g for global, i for inplace

# extract substring with regular expression pattern
sed -i 's/^.*(pattern).*$/\1/g' # s for substitute, g for global, i for inplace, \1 for back referencing
# same purpose can be achieved with grep
egrep -o 're pattern' # -o for match only
echo 'http://speech.ee.ntu.edu.tw/DSP2017Spring/Videos/20170426_8.0.fsp.wmv/media.wmv' |sed -e 's/^.*\(2017[0-9]*_[0-9]*\).*$/\1.wmv/g'
echo 'http://speech.ee.ntu.edu.tw/DSP2017Spring/Videos/20170426_8.0.fsp.wmv/media.wmv' |egrep -o '2017[0-9]*_[0-9]*'

# directory 
find . -type f -print0 | xargs -0 sed -i 's/subdomainA\.example\.com/subdomainB.example.com/g'
# -print0 (GNU find only) tells find to use the null character (\0) instead of whitespace as the output delimiter between pathnames found. This is a safer option if you files can contain blanks or other special character. It is recommended to use the -print0 argument to find if you use -exec command or xargs (the -0 argument is needed in xargs.).

########################## AWK #######################################
awk '{print $1}' # print the first substring, after separated by separator white space
