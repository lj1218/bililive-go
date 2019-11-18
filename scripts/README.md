## 辅助脚本使用说明

### 功能简介

支持自定义设置单个录制视频大小。

### 拷贝录制软件

从 `bin` 目录拷贝录制软件至本目录根路径下。

### 打开文件 record_conf.sh，设置录制配置

+ 设置录制软件名称 `prog`，如：prog=bililive-darwin-amd64

+ 设置直播平台 `platform`，如：platform="斗鱼"

+ 设置直播房间 url 前缀 `url_prefix`，如：url_prefix="https://www.douyu.com"

+ 设置直播房间号 `roomid` 和 主播名字 `hostname`，如：roomid=99999，hostname="旭旭宝宝"

+ 设置单个视频最大尺寸 `video_max_size`，如：video\_max\_size=629145600

    > 视频尺寸单位：字节

+ 检查间隔 `check_interval`，如：check_interval=10  # 10s

### 启动程序

```bash
./start_record.sh
```

### 停止程序

```bash
./stop_record.sh
```

### Author

**lj1218** : [https://github.com/lj1218](https://github.com/lj1218)
