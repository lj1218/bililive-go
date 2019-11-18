#!/bin/sh
# Author: lj1218

# 录制软件名称
prog=bililive-darwin-amd64

# 直播平台
platform="斗鱼"

# 直播房间 url 前缀
url_prefix="https://www.douyu.com"

# 直播房间号
roomid=99999

# 主播名字
hostname="旭旭宝宝"

# 直播房间 url
url="${url_prefix}/${roomid}"

# 单个视频最大尺寸
video_max_size=629145600  # 600M = 600*1024*1024 byte

# 检查间隔
check_interval=10  # 10s

# 进程号文件
pidsfile="pid_file.txt"

# 视频文件所在目录
dir="${platform}/${hostname}"
