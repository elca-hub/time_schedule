# time_schedule

[![Ruby on Rails CI](https://github.com/elca-hub/time_schedule/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/elca-hub/time_schedule/actions/workflows/rubyonrails.yml)

※ このリポジトリはruby on railsの遊び場です ※

## version

- ruby : 3.2.2
- rails : 7.0.4.3

## What's time_schedule

ユーザが時間割を登録するだけのシステム

と思ったけど、SNS的なシステムになりそうです。

## 備忘録

### consoleへの入り方

```bin
bin/rails console
```

### サーバの立ち上げ

```bin
bin/rails server
```

### モデル(コントローラー)の生成

```bin
bin/rails generate model(controller) [名称] [プロパティ]
```

Ex.

```bin
bin/rails generate model User name:string password:string
```

### マイグレーション

```bin
bin/rails db:migrate
```
