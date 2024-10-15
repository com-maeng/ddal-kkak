#!/bin/bash

DDAL_KKAL_HOME="/usr/local/ddal-kkak"

docker exec -it ddal-kkak-$n bash -c "mkdir /root/.jupyter"
docker cp $DDAL_KKAL_HOME/jupyter/jupyter_notebook_config.py \
    ddal-kkak-$n:/root/.jupyter/jupyter_notebook_config.py
docker cp $DDAL_KKAL_HOME/jupyter/jupyter_server_config.json \
    ddal-kkak-$n:/root/.jupyter/jupyter_server_config.json
