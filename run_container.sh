docker run -it \
    --name cuda-0 \
    --publish 8888:8888 \
    --gpus all \
    --shm-size=16g \
    yihongju/cuda:0.1 \
    bash
