# データ分析環境の構築（非GPU）
データ分析用の環境構築がすぐできるようにメモ
Kaggle 公式の docker image をベースに、必要なライブラリなどを追加している。

## 前提
- OS: Windows 10
- WSL のインストールが完了している

    ```
    C:\Users\hoge wsl -l -v /// コマンドプロンプトで
    NAME                   STATE           VERSION
    * Ubuntu-20.04           Running         2
    ```

- Docker for Windows のインストールが完了
    ```
    $ docker --version
    Docker version 20.10.5, build 55c4c88
    $ docker-compose --version
    docker-compose version 1.29.0, build 07737305

## コンテナを起動する 
WSL のコンソールを立ち上げて、以下のコマンドを実行

```$ docker-compose up --build```

## notebook にアクセスする
Docker for Windows の コンテナ一覧にある"myenvironement" の OPEN IN BROSER から notebook にアクセスできる
~~（初回のみWSLのコンソール上に表示される token の入力を求められる）~~
 ![](image/2021-06-27-15-48-43.png)

## 参考

1. [Dockerでデータ分析環境を手軽に作る方法](https://amalog.hateblo.jp/entry/data-analysis-docker)

2. [Kaggle 公式](https://github.com/Kaggle/docker-python)

3. [オレオレJupyterlab環境をDockerで作った](https://zenn.dev/fuchami/articles/d1625ac784fe5d)

## Todo
- ~~jupyter lab にしたい~~
- ~~Windows 側のフォルダへのアクセスをさっとできるようにしたい~~
- Container machine のスペック設定を変えたい
- [キャッシュを消す](https://nykergoto.hatenablog.jp/entry/2020/07/25/%E6%A9%9F%E6%A2%B0%E5%AD%A6%E7%BF%92%E3%81%AAdockerfile%E3%82%92%E6%9B%B8%E3%81%8F%E3%81%A8%E3%81%8D%E3%81%AB%E6%B0%97%E3%82%92%E3%81%A4%E3%81%91%E3%81%A8%E3%81%8F%E3%81%A8%E8%89%AF%E3%81%84%E3%81%93)
- テストを書く
