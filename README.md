# BiliDanmaku - 根据CID下载B站整部番剧的弹幕并转换为ASS输出
## 环境要求
1.Linux系统、MacOSX

2.安装curl、git、python3
## 使用方法
1.下载main.sh脚本
  - Linux ```curl -L https://github.com/fangxx3863/BiliDanmaku/raw/main/main.sh -o main.sh```
  - MacOSX ```curl -L https://github.com/fangxx3863/BiliDanmaku/raw/main/main.sh -o macos.sh```
  
2.给予执行权限
  - ```chmod 777 main.sh```
  
3.打开b站的番剧视频页面，记下链接中ss后的数字
  - ```www.bilibili.com/bangumi/play/ss844/?from=search&seid=3312043637264681016```
  - 例如这个链接中的ss**844** 

4.运行程序
  - ```./main.sh```
  
5.按照要求填入CID

6.按照要求填入字体名称
  - 注意这里填入的是生成ass弹幕中的字体

7.复制AssOut中的字幕，放入你喜欢的支持ass字幕的播放器即可

## 使用到的开源库
https://github.com/m13253/danmaku2ass

***在此感谢作者！***
