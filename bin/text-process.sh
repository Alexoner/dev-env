#!/bin/sh -x

echo "this is a tutorial about text processing with shell"

########################### cat #######################################
cat ${INPUT} # concatenate files

########################### less #######################################
less ${INPUT} # file perusal filter for crt viewing

########################### grep #######################################
grep 'pattern' ${INPUT} # text pattern
egrep 'pattern' ${INPUT} # regular expression pattern
#-o: only show matching portion
#--color
#-A: number of lines after
#-C: context number


########################### sed #######################################
#-r: extended regular expression

# substitute substring
sed -r 's/pattern/target/g' # -r for extended regular expression, s for substitute, g for global
sed -r -i 's/pattern/target/g' # s for substitute, g for global, i for inplace

# extract substring with regular expression pattern
sed -r -i 's/^.*(pattern).*$/\1/g' # s for substitute, g for global, i for inplace, \1 for back referencing


## advanced example
echo "hello cruel world" | sed -r 's/(h.+o)(.+)(w.+d)/\1, \3/g' # "hello cruel world" -> "hello, world"
# parse log file with regular expression: extract date, error code, error code literal name into a csv file
cat leaf_node_service_worker_ficus.ERROR |sed -r -n -e 's/(E[0-9]+)[^a-zZ-Z]+?(\S+[ch]pp:[0-9]+).*error code: (-?[0-9]+), (FICUS\w+)/\1,\2,\3,\4/pg' > date-error-name.csv
#cat leaf_node_service_worker_ficus.ERROR |grep 'E0909' |sed -r -n -e 's/(E0909)[^a-zZ-Z]+?(\S+[ch]pp:[0-9]+).*error code: (-?[0-9]+), (FICUS\w+)/\1,\2,\3,\4/pg'|tee /tmp/date-error-name.csv
#cat leaf_node_service_worker_ficus.ERROR |sed -r -n -e "s/(E[0-9]+)[^a-zZ-Z]+?(\S+[ch]pp:[0-9]+).*error code: (-?[0-9]+), (FICUS\w+)/\1,\2,\3,\4/pg" |sort -h |uniq -c |sort -hr


# same purpose can be achieved with grep
egrep -o 're pattern' # -o for match only
echo 'http://speech.ee.ntu.edu.tw/DSP2017Spring/Videos/20170426_8.0.fsp.wmv/media.wmv' |sed -e 's/^.*\(2017[0-9]*_[0-9]*\).*$/\1.wmv/g'
echo 'http://speech.ee.ntu.edu.tw/DSP2017Spring/Videos/20170426_8.0.fsp.wmv/media.wmv' |egrep -o '2017[0-9]*_[0-9]*'

# directory 
find . -type f -print0 | xargs -0 sed -i 's/subdomainA\.example\.com/subdomainB.example.com/g'
# -print0 (GNU find only) tells find to use the null character (\0) instead of whitespace as the output delimiter between pathnames found. This is a safer option if you files can contain blanks or other special character. It is recommended to use the -print0 argument to find if you use -exec command or xargs (the -0 argument is needed in xargs.).


########################## AWK #######################################
awk '{print $1}' # print the first substring, after separated by separator white space
########################### awk #######################################
