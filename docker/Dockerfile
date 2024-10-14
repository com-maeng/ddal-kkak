FROM nvidia/cuda:12.4.1-cudnn-devel-ubuntu22.04

WORKDIR /root/miniconda3

RUN apt update && apt install -y wget git

RUN <<EOF
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O /root/miniconda3/miniconda.sh && \
bash /root/miniconda3/miniconda.sh -b -u -p /root/miniconda3 && \
rm /root/miniconda3/miniconda.sh && \
. /root/miniconda3/bin/activate && \
conda init --all
EOF

RUN <<EOF
. /root/miniconda3/bin/activate && \
conda create -yn yeardream-startup-project python=3.12 && \
    conda activate yeardream-startup-project && \
    conda install -y notebook pytorch torchvision torchaudio pytorch-cuda=12.4 -c pytorch -c nvidia
EOF

# For detached mode
CMD ["tail", "-f", "/dev/null"]
