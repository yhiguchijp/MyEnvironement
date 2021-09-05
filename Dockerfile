# kaggle の python 環境をベースにする
FROM gcr.io/kaggle-images/python:latest

# mecabとmecab-ipadic-NEologdの導入
RUN apt-get update \
    && apt-get install -y mecab \
    && apt-get install -y libmecab-dev \
    && apt-get install -y mecab-ipadic-utf8 \
    && apt-get install -y git \
    && apt-get install -y make \
    && apt-get install -y curl \
    && apt-get install -y xz-utils \
    && apt-get install -y file \
    && apt-get install -y sudo

RUN git clone --depth 1 https://github.com/neologd/mecab-ipadic-neologd.git \
    && cd mecab-ipadic-neologd \
    && bin/install-mecab-ipadic-neologd -n -y

# ライブラリの追加インストール
RUN pip install -U pip && \
    pip install bs4 && \
    pip install pandasgui && \
    pip install fastprogress japanize-matplotlib && \
    pip install mecab-python3

# 自動整形,コード補間など
# nodejs
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && sudo apt-get install -y nodejs

# install kite-engine
RUN cd && \
    wget https://linux.kite.com/dls/linux/current && \
    chmod 777 current && \
    sed -i 's/"--no-launch"//g' current > /dev/null && \
    ./current --install ./kite-installer

RUN pip install autopep8 --no-cache-dir &&\
    pip install jupyterlab-kite --no-cache-dir &&\
    pip install jupyterlab_code_formatter --no-cache-dir

# JupyterLab Extention 
RUN jupyter labextension install \
        @ryantam626/jupyterlab_code_formatter \
        @lckr/jupyterlab_variableinspector@3.0.7 \
        @hokyjack/jupyterlab-monokai-plus \
        @jupyterlab/toc \
        @kiteco/jupyterlab-kite \
    && jupyter serverextension enable --py jupyterlab_code_formatter

# Clean up cache
RUN apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /usr/local/src/* && \
    rm -rf ~/.cache/pip
