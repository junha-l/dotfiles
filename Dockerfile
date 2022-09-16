FROM nvidia/cuda:11.1.1-cudnn8-devel-ubuntu18.04
SHELL ["/bin/bash", "-c"]

ENV TZ Asia/Seoul
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime

RUN apt update && apt install -y --no-install-recommends \
        apt-utils \
        build-essential \
        cmake \
        curl \
        git \
        htop \
        man \
        wget \
        openssh-server \
        software-properties-common \
        sudo \
        tmux \
        vim-athena \
	locales \
        zsh && \
        rm -rf /var/lib/apt/lists/*

# Install conda
WORKDIR /tmp
RUN curl -O https://repo.anaconda.com/miniconda/Miniconda3-py38_4.10.3-Linux-x86_64.sh
RUN bash Miniconda3-py38_4.10.3-Linux-x86_64.sh -b -p /opt/miniconda3
RUN rm Miniconda3-py38_4.10.3-Linux-x86_64.sh

# Set the locale
RUN sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8
ENV LANG en_US.UTF-8  
ENV LANGUAGE en_US:en  
ENV LC_ALL en_US.UTF-8 

RUN mkdir /var/run/sshd

WORKDIR /root
RUN git clone https://github.com/junha-l/dotfiles
RUN cd dotfiles
RUN bash dotfiles/install-vim.sh
RUN bash dotfiles/install-zsh.sh
RUN bash dotfiles/install-tmux.sh
RUN /opt/miniconda3/bin/conda init zsh 

EXPOSE 22


