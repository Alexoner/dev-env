#题目一 日常系统操作实践
#子题目1 杀死某进程
#题目: 打开gedit. 现在需要在terminal中杀死这个进程. 请用文字描述操作方法. 需要给出 htop, ps grep kill, pkill 三种解法
#子题目2 系统检测
#题目: 请mentor找一台正在训练用的机器,登录查看系统状态. 当前机器的读写磁盘是什么速度? 网络出入是什么速度? 哪个员工的什么进程在使用GPU? 哪个员工的什么进程使用了最多的CPU/最多的内存? 请描述查看的过程
#子题目3 文件传输
#题目:  分别使用 cp, scp ,  rsync   拷贝 /mnt/ficusdenmark/zzhang/release/data/tutorial/bash/20180131110000-20180131190000  （北京见：/mnt/BJG0005/zzhang/release/data/tutorial/bash/20180131110000-20180131190000）到本地工作站. 记录下每个命令, 和每个命令执行的时间. 
#子题目4 清理目录
#题目: 上一个题目中copy过来的目录, 使用 ncdu 查看目录总文件大小, 并且在ncdu中删除其中大小最大的子目录. 描述操作过程.htop: / to search, F3 to search next, k/F9 to kill
ps aux |grep {PROCESSNAME} |grep -v grep |kill -9 awk '{print $2}'
pkill htop
time rsync -avP ficusRomania:/mnt/ficusdenmark/zzhang/release/data/tutorial/bash/20180131110000-20180131190000 /tmp/monitordata
time scp -r ficusRomania:/mnt/ficusdenmark/zzhang/release/data/tutorial/bash/20180131110000-20180131190000 /tmp/monitordata 
ncdu:
? for help
s sort by size
d delete题目二 文本处理
#/mnt/ficusdenmark/zzhang/release/data/tutorial/bash/log_stat/log.txt （北京在：/mnt/BJG0005/zzhang/release/data/tutorial/bash/log_stat/log.txt）是我们某训练系统的真实速度profile日志. 现在需要你对这个日志做一些统计处理. 要求解答给出所使用的脚本.
#子题目1 过滤
#题目: 过滤此文件, 仅保留含 [BackwardTimer] 或 [ForwardTimer] 的行
#提示: grep + 或
#子题目2 行内裁剪
#题目: 基于题目1的结果, 把形如 "I0319 16:02:44.677803 19454 Stat.h:204] Stat: " 的部分都去掉
#提示: sed + 正则表达式
#子题目3 分组计数
#题目: 基于题目2的结果, 统计这段内容 BackwardTimer ForwardTimer 各出现了多少次
#提示: cut 和 uniq -c
#子题目4 字符替换
#题目: 基于子题目2的结果, 把文本变成无head的csv格式. (相当于每列按照逗号(',')分割)
#提示: tr
#子题目5 行插入
#题目: 基于题目4的结果, 文本第一行上插入 'computation,layer_name,time_cost' 这行内容
#提示: 多命令group, 或者 sed
#子题目6 高级文本替换
#题目: 基于子题目4的结果. 目前文本行形如 "[ForwardTimer],__conv_0__,[Span:6ms338us]". 需要把他们变成 "[ForwardTimer],__conv_0__,6.338ms"
#提示:
#sed
#小心小数位数. 不能假设ms后us前一定是三位数字!
#子题目7 求和
#题目: 基于子题目6的结果, [ForwardTimer] 中, 第三列耗时的总和是多少? 
#提示: awk 或 paste和bc
#子题目8 排序
#题目: 基于子题目6的结果, 第三列耗时最多的 layer_name 是什么?
#提示: sort
echo "original: "
head -n 10 /mnt/ficusdenmark/zzhang/release/data/tutorial/bash/log_stat/log.txt
echo "filtered: "
head -n 10 /mnt/ficusdenmark/zzhang/release/data/tutorial/bash/log_stat/log.txt | egrep '\[BackwardTimer|ForwardTimer\]' | tee /tmp/filtered.txt

cat /tmp/filtered.txt
echo "============================"
# XXX: use sed -r with regular expression
cat /tmp/filtered.txt | sed -r 's/I0319 .* [a-zA-Z0-9]+\.(cpp|h):[0-9]+] Stat: //g' | tee /tmp/Q2.2.txt
# cat /tmp/filtered.txt |sed -r 's/I0319 .*\.(h|cpp):[0-9]+/damnit/g'


cat /tmp/Q2.2.txt |egrep -o '(BackwardTimer|ForwardTimer)' |sort | uniq -c

cat /tmp/Q2.2.txt |tr ' ' ',' | tee /tmp/Q2.4.txt

sed '1icomputation,layer_name,time_cost' /tmp/Q2.4.txt | tee /tmp/Q2.5.txt

# XXX: sed back reference in regular expression
sed -r 's/\[Span:([0-9]+)ms([0-9]+)us\]/\1\.\2ms/g' /tmp/Q2.4.txt | tee /tmp/Q2.6.txt

cat /tmp/Q2.6.txt|grep ForwardTimer | awk --field-separator ',' '{s += $3}END{print s}' | tee /tmp/Q2.7.txt

cat /tmp/Q2.6.txt | sort --field-separator , -rnk3,3 | head -n 1 | cut -d , -f 2,2 | tee /tmp/Q2.8.txt

#题目三 多机GPU利用率统计
#子题目1 统计GPU平均利用率
#题目：给出脚本，在GPU服务器上运行时，能够输出所有卡的GPU利用率平均，保留2位小数
#样例输入：bash run.sh
#样例输出：93.31%
#提示：
#求平均在教程中没有直接给出解法，可能需要自行搜索

#子题目2 统计远程GPU服务器平均利用率（选做）
#题目：给出脚本，在工作站上运行时，能够统计给定GPU服务器上所有卡的GPU利用率平均，保留2位小数
#样例输入：bash run.sh ficusfrance
#样例输出：67.31%

#子题目3 统计多个远程GPU服务器各自平均利用率（选做）
#题目：给出脚本，在工作站上运行时，对于一个列表文件中每个GPU服务器，都统计它的所有卡的GPU利用率平均，保留2位小数
#样例输入：bash run.sh machines.list （其中machines.list有两行，分别是 ficusengland ficusfrance）
#样例输出：
#ficusengland 34.05%
#ficusfrance 56.77%

report=`nvidia-smi |egrep '[0-9]+%'|sort -nk 13,13`
# cat <<EOF
# $report
# EOF
echo -e "$report"
gpu-stat() {
#     nvidia-smi |egrep '[0-9]+%' | awk 'BEGIN{ s = 0; n = 0;} { s+= $13; n += 1} END {print s, n, "cards, avg gpu usage: "s/n}'
    #nvidia-smi |egrep '[0-9]+%'|sort -nk 13,13 | awk '
    #echo -e $report |egrep '[0-9]+%'|sort -nk 13,13 | awk '
    nvidia-smi |egrep '[0-9]+%'| sort -nk 13,13 | awk '
    {
        count[NR] = $13;
        sum += $13;
        print "gpu: ", $13;
    } 
    END {

        if (NR % 2) {
            median = count[(NR + 1) / 2];
        } else {
            median = (count[(NR / 2)] + count[(NR / 2) + 1]) / 2.0;
        }
        average = sum/NR;
        printf "%d cards\n", NR;
        printf "median gpu usage: %.2f%%\n", median;
        printf "avg gpu usage: %.2f%%\n", average;
    }'
}
gpu-stat

# XXX: use typeset to show function definition.  closing EOF without leading white spaces
rgpu-usage() {
    ssh ficusromania << EOF
    $(typeset -f gpu-stat)
    gpu-stat
EOF
}
rgpu-usage ficusromania 2> /dev/null |egrep 'median|avg'

echo "ficusromania" > /tmp/machines.list
gpu-usage-batch() {
    for i in `cat $1`
    do
        echo $i "`rgpu-usage $1 2> /dev/null |egrep 'avg' |egrep -o '[0-9\.]+%'`"
    done
}
gpu-usage-batch /tmp/machines.list

#题目四 批量图片变换
#子题目1 图片变换
#题目：给出脚本，接受输入图片路径，和输出图片路径，能够对输入文件做左右反转并且输出。
#样例输入：bash run.sh cat.jpg flip_cat.jpg
#样例输入：flip_cat.jpg变成cat.jpg的左右反转
#提时：在教程中没有直接给出解法，可能需要自行搜索

#子题目2 带路径保留的图片变换
#题目：给出脚本，接受输入图片路径，和输出目录，要求左右反转图片，输出到输出目录（如不存在，自行创建）中，并且保留文件名的目录结构。
#样例输入：bash run.sh shanghai/yitu/cat.jpg result
#样例输出：result/shanghai/yitu/cat.jpg 变成 shanghai/yitu/cat.jpg 的左右反转

#子题目3 全目录带路径保留的图片变换
#题目：给出脚本，接受输入目录，和输出目录，递归遍历输入目录中每个jpg图片，左右反转，输出到输出目录（如不存在，自行创建）中，并且保留文件名的目录结构。
#样例和输出：bash run.sh thu hku
#注意: 不能直接使用 cp -r, 因为会导致其他非 jpg 文件或者空目录也被复制
$ find thu -name '*jpg'
thu/gate.jpg
thu/cs/intro.jpg
thu/cs/ai/rl.jpg
thu/stat/gussian.jpg
$ bash run.sh thu hku
$ find hku -name '*jpg'
hku/thu/gate.jpg
hku/thu/cs/intro.jpg
hku/thu/cs/ai/rl.jpg
hku/thu/stat/gussian.jpg

#子题目4 并行处理
#题目：需求同子题目3。要求实现4并行度的并行操作。

img-flip() {
    convert $1 -flop $2
}
img-flip ~/Downloads/Lenna.png /tmp/a.png
xdg-open /tmp/a.png

img-flip() {
    DIRNAME=`dirname $1`
    mkdir -p $2/$DIRNAME
    outputPath=$2/$1
    echo "converting $1 to $2"
    convert $1 -flop $outputPath 
}
# test
mkdir img
cp ~/Downloads/Lenna.png img/
img-flip img/Lenna.png /tmp
xdg-open /tmp/img/Lenna.png

# method 1: recursively call functions, not easy to parallize
# method 2: use find to get file lists to build a stack, easy to parallize!
export -f img-flip
img-flip-batch() {
    FILES=`find $1 -iname '*.jpg'`
    echo "destination directory: $2"
    find $1 -iname '*.jpg' |xargs -I {} bash -c "img-flip {} $2"
#     find $1 -iname '*.jpg' |xargs -I {} echo {} $2
}

# test
img-flip-batch /mnt/ficusromania/hdu/ficus/external/rocksdb/docs/static/images/ ../test/tmp
find ../test

img-flip-parallel() {
    FILES=`find $1 -iname '*.jpg'`
    echo "destination directory: $2"
    find $1 -iname '*.jpg' |xargs -P 4 -I {} bash -c "sleep 10;img-flip {} $2"
#     parallel bash -c "sleep 10; img-flip {} $2" ::: find $1 -iname '*.jpg'
}
# test
img-flip-parallel /mnt/ficusromania/hdu/ficus/external/rocksdb/docs/static/images/ ../test/tmp
find ../test -iname '*.jpg'
