#!/bin/bash

DDAL_KKAL_HOME="/usr/local/ddal-kkak"

docker exec ddal-kkak-$1 bash -c "mkdir /root/.jupyter"
docker cp $DDAL_KKAL_HOME/jupyter/jupyter_notebook_config.py \
    ddal-kkak-$1:/root/.jupyter/jupyter_notebook_config.py
docker cp $DDAL_KKAL_HOME/jupyter/jupyter_server_config.json \
    ddal-kkak-$1:/root/.jupyter/jupyter_server_config.json
