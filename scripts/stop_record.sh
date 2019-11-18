#!/bin/sh
# Author: lj1218

. record_conf.sh
cat ${pidsfile} | xargs kill && rm ${pidsfile}
