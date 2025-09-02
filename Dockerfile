FROM ubuntu:18.04

# 環境変数の設定
ENV DEBIAN_FRONTEND=noninteractive
ENV USER=lineage
ENV HOME=/home/lineage

# 必要なパッケージのインストール
RUN apt-get update && \
    apt-get install -y \
    bc \
    bison \
    build-essential \
    curl \
    flex \
    g++-multilib \
    gcc-multilib \
    git \
    gnupg \
    gperf \
    sudo \
    imagemagick \
    lib32ncurses5-dev \
    lib32readline-dev \
    lib32z1-dev \
    liblz4-tool \
    libncurses5-dev \
    libsdl1.2-dev \
    libssl-dev \
    libwxgtk3.0-dev \
    libxml2 \
    libxml2-utils \
    lzop \
    pngcrush \
    rsync \
    schedtool \
    squashfs-tools \
    xsltproc \
    zip \
    zlib1g-dev \
    openjdk-8-jdk \
    python \
    python3 \
    android-tools-adb \
    android-tools-fastboot \
    vim \
    && apt-get clean

# Python2のシンボリックリンク作成
RUN ln -sf /usr/bin/python2 /usr/bin/python

# ユーザーの作成
RUN useradd -m -s /bin/bash $USER && \
    echo "$USER ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers \

# rootのパスワードは手動で設定してください
RUN echo "root:" | chpasswd

# 作業ディレクトリの設定
WORKDIR $HOME

# repoツールのインストール
RUN curl https://storage.googleapis.com/git-repo-downloads/repo > /usr/local/bin/repo && \
    chmod a+x /usr/local/bin/repo

USER $USER
