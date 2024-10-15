#!/bin/bash

NUM_CONTAINERS=10
SHM_SIZE=16g
DDAL_KKAL_HOME="/usr/local/ddal-kkak"

docker build -t yihongju/ddal-kkak:0.1 \
    $DDAL_KKAL_HOME/docker --no-cache

for n in $(seq 0 $((NUM_CONTAINERS - 1)))
do
docker run -d \
    --name ddal-kkak-$n \
    --gpus all \
    --shm-size=$SHM_SIZE \
    --publish $((n + 8888)):8888 \
    --restart always
    yihongju/ddal-kkak:0.1
bash $DDAL_KKAL_HOME/jupyter/set_jupyter_config.sh $n
done
