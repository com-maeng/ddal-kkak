FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

WORKDIR /root/miniconda3

RUN apt update && apt install -y wget

RUN <<EOF
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda3/miniconda.sh && \
bash ~/miniconda3/miniconda.sh -b -u -p ~/miniconda3 && \
rm ~/miniconda3/miniconda.sh && \
. ~/miniconda3/bin/activate && \
conda init --all
EOF

RUN <<EOF
. ~/miniconda3/bin/activate && \
conda create -yn yeardream-company-project python=3.12 && \
    conda activate yeardream-company-project && \
    conda install -y notebook pytorch torchvision torchaudio pytorch-cuda=12.4 -c pytorch -c nvidia
EOF
