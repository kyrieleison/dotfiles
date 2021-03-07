# dotfiles

## Install
初回のセットアップを行います。
必要なライブラリのインストールや、一度のみ実行が必要な初期化処理を行います。

```sh
% git clone git@github.com:kyrieleison/dotfiles.git $HOME/dotfiles
% cd $HOME/dotfiles && ./init.sh
```

## Deploy
初回のセットアップ以降に、ホームディレクトリにドットファイルへのシンボリックリンクを貼ります。
新しいドットファイルを追加した場合は、再度実行する必要があります。

```sh
% cd $HOME/dotfiles && ./deploy.sh
```

## Update
ライブラリのバージョンアップを行います。

```sh
% cd $HOME/dotfiles && ./update.sh
```
