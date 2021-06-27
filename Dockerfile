# kaggle の python 環境をベースにする
FROM gcr.io/kaggle-images/python:latest

# ライブラリの追加インストール
RUN pip install -U pip
# RUN pip install fastprogress japanize-matplotlib ...