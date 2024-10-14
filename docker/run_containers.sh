#!/bin/bash

NUM_CONTAINERS=10
SHM_SIZE=16g

docker build -t yihongju/ddal-kkak:0.1 ./docker --no-cache

for n in $(seq 0 $((NUM_CONTAINERS - 1)))
do
docker run -d \
    --name ddal-kkak-$n \
    --gpus all \
    --shm-size=$SHM_SIZE \
    yihongju/ddal-kkak:0.1
done
