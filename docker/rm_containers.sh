#!/bin/bash

NUM_CONTAINERS=10
SHM_SIZE=16g
DDAL_KKAL_HOME="/usr/local/ddal-kkak"

for n in $(seq 0 $((NUM_CONTAINERS - 1)))
do
docker container stop ddal-kkak-$n
docker container rm ddal-kkak-$n
done
