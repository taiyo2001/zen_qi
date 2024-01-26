# README

### プロジェクト概要
---
Qiitaの複製

### LocalのDev環境構築
---
.tool-versionsを確認して、ruby & nodejsセットアップ後

yarnが導入されていない場合(webpacker等で利用)
```
npm i -g yarn
```

Build
```
bundle && yarn && rails db:migrate:reset && rails db:seed
```

立ち上げ
```
bin/dev
```
