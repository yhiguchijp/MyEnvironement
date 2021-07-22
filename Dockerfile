# kaggle の python 環境をベースにする
FROM gcr.io/kaggle-images/python:latest

# ライブラリの追加インストール
RUN pip install -U pip && \
    pip install bs4 && \
    pip install pandasgui && \
    pip install fastprogress japanize-matplotlib --no-cache-dir && \
    rm -rf ~/.cache/pip

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

RUN pip install mecab-python3

# nodejsの導入
RUN curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash - \
    && sudo apt-get install -y nodejs

## JupyterLabの拡張機能

# 変数や行列の中身を確認
RUN jupyter labextension install @lckr/jupyterlab_variableinspector

# 自動整形,コード補間
RUN pip install autopep8 \
    pip install jupyterlab-kite \
    && pip install jupyterlab_code_formatter \
    && jupyter labextension install \
        @ryantam626/jupyterlab_code_formatter \
        @hokyjack/jupyterlab-monokai-plus \
        @jupyterlab/toc \
    && jupyter serverextension enable --py jupyterlab_code_formatter


# install jupyter-kite
RUN cd && \
    wget https://linux.kite.com/dls/linux/current && \
    chmod 777 current && \
    sed -i 's/"--no-launch"//g' current > /dev/null && \
    ./current --install ./kite-installer
