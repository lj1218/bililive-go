#!/bin/sh
# Author: lj1218

. record_conf.sh
mypid=$$
pid=
log="${roomid}/log-record-${roomid}-$(date +%Y%m%d-%H%M%S).txt"

mkdir -p ${roomid}
while :
do
  # 当存在 录制程序 进程时，退出
  cnt=$(ps -ef | grep ${prog} | grep -w "${url}" | grep -v grep | wc -l | sed 's/ //g')
  [ ${cnt} -gt 0 ] && {
    echo "Error: found ${cnt} instances for: ${prog} -i ${url}"
    exit 1
  }

  # 当录制程序未启动时，启动录制程序
  pid=$(ps -ef | grep ${prog} | grep -w "${url}" | grep -v grep | awk '{print $2}')
  [ -z ${pid} ] && {
    logfile="${roomid}/log-${roomid}-$(date +%Y%m%d-%H%M%S).txt"
    ./${prog} -i ${url} >${logfile} 2>&1 &
    pid=$!
  }
  # 将当前脚本 pid、录制进程 pid 写入文件，供 stop 脚本使用
  echo ${mypid} > ${pidsfile}
  echo ${pid} >> ${pidsfile}

  echo "[$(date +%Y-%m-%d\ %H:%M:%S)] pid of myself = ${mypid}, ${prog} = ${pid}" >> ${log}
  mkdir -p ${dir} && touch ${dir}/foo
  while :
  do
    sleep ${check_interval}
    fsize=$(ls -lt ${dir} | sed -n '2p' | awk '{ print $5 }')
    echo "fsize=${fsize}" >> ${log}
    [ ${fsize} -gt ${video_max_size} ] && {
      # 视频文件超过 video_max_size，kill 当前录制进程
      echo "[$(date +%Y-%m-%d\ %H:%M:%S)] kill ${pid}" >> ${log}
      kill ${pid}
      break
    }
  done
done
