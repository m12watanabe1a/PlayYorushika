# PlayYorushika
ヨルシカの「だから僕は音楽を辞めた」と「エルマ」を交互に再生するだけのシェルスクリプトです．Macの人用です．


リポジトリをクローンしてから
```
$ git clone https://github.com/m12watanabe1a/PlayYorushika.git
$ cd PlayYorushika
```

実行権限を追加して
```
$ chmod 755 play.sh
```

以降はターミナルから以下を実行すれば再生されるはずです．
```
$ play.sh
```

### Usage
コマンド引数
- -s: シャッフル再生されます．1-14まで任意の順番で再生されますが，例えば「だから僕は音楽を辞めた」の6番が流れたあとは必ず「エルマ」の6番が流れます．

```
$ play.sh -s
```
