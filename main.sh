#!/bin/bash
#下载依赖
#JQ
echo "下载依赖(1s后开始)......."
sleep 1
if ! [ -f ./jq ]; then
    curl -L "https://github.com/stedolan/jq/releases/download/jq-1.6/jq-linux64" -o jq
    chmod 777 jq
fi
jqdir=$(ls | sed "s:^:`pwd`/:"|grep jq)
jqdir=$(echo ${jqdir%??})
PATH=$PATH:$jqdir

#danmaku2ass
git clone https://github.com/m13253/danmaku2ass.git

#读入SID
echo 输入番剧SID
read sid

#读入字体名称
echo "输入字体名称(留空默认汉仪粗黑简)"
read font
if [ "$font" = "" ]
then
	font=汉仪粗黑简
	echo "你选择的字体为 $font"
else
	echo "你选择的字体为 $font"
fi
sleep 1
rm -rf AssOut

#保存LIST
mkdir BiliTmp
cd BiliTmp
curl "http://bangumi.bilibili.com/web_api/get_ep_list?season_id=$sid" | jq > seasonlist.txt
list=$(cat ./seasonlist.txt)
echo $list|jq '.result[].cid' > cid.txt

#下载弹幕xm
mkdir ../AssOut
index=0
for line in $(cat ./cid.txt)
do
	index=$(($index+1))
	echo "CID: $line"
	curl -L https://comment.bilibili.com/$line.xml --user-agent 'Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/88.0.4324.150 Safari/537.36' -o $index.xml --compressed
	python3 ../danmaku2ass/danmaku2ass.py -o ../AssOut/$index.ass -s 1920x1080 -fn "$font" -fs 48 -a 0.8 -dm 5 -ds 5 $index.xml
done

cd ../
rm -rf BiliTmp
echo Comple!
echo 输出目录为AssOut!
