# README
会員制の地域イベント検索サービスです。
会員登録を行い、検索を行ってください


## Support version

以下のバージョンで動作確認しています

- ruby 2.3.0
- rails 5.0.1
- slim 3.1.2
- sorcery 0.10.2
- bootstrap 3

## System dependencies

- rbenvで管理する
```
$ rbenv --global 2.3.0
```
## Configuration

```
git clone git@github.com:feat-kj/rails_practice.git
```  
- bundlerで管理するようにする。他の環境に影響を与えないように
  project内に Rails をinstall
```
$ bundle install --path vendor/bundle
```  
## Database creation

```  
bundle exec rails db:migrate
```  
## Database initialization

```
bundle exec rails db:seed_fu
```
## How to run

- サーバー起動
```
bundle exec rails server
```
- アクセス
```
http://localhost:3000/
```

## ...
