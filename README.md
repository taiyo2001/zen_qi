# README

### プロジェクト概要
---
Qiitaの複製

プロジェクト詳細(技術選定, etc.)
* [wiki](https://github.com/taiyo2001/zen_qi/wiki)

### LocalのDev環境構築
---
<!-- .tool-versionsを確認して、ruby & nodejsセットアップ後 -->
.tool-versionsを確認して、rubyをセットアップ後

<!-- yarnが導入されていない場合(webpacker等で利用)
```
npm i -g yarn
``` -->

Build
<!-- bundle && yarn && rails db:migrate:reset && rails db:seed -->
```
bundle && rails db:migrate:reset && rails db:seed
```

立ち上げ
```
bin/dev
```

### ログイン情報
---
|  | email | password |
| :--- | :---: | ---: |
| test user | zenqisample@example.com | password |
| other user(n<sup>※</sup>) | sample#{n}@example.com | password |

※nは1~50
