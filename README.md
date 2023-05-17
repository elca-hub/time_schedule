# time_schedule

[![Ruby on Rails CI](https://github.com/elca-hub/time_schedule/actions/workflows/rubyonrails.yml/badge.svg)](https://github.com/elca-hub/time_schedule/actions/workflows/rubyonrails.yml)

※ このリポジトリはruby on railsの遊び場です ※

## version

- ruby : 3.2.2
- rails : 7.0.4.3

## TODO

- [ ] ユーザの削除、情報変更処理の実装
- [ ] タスクの削除機能の実装
- [ ] ユーザが他のユーザに対して、自身のタスクを共有するような機能の実装
- [ ] タスクに「科目」を追加し、科目ごとにタスクを管理

## What's time_schedule

大まかに言うと、ユーザが簡単にタスク管理してくれるとありがたいなってツール

## 動かし方

### 注意

このwebアプリを動かすには**Docker**が必要となります。

### 起動

```bin
docker-compose up web
```

### 初回のみ必要な操作

※ webコンテナはupした状態で操作すること

```bin
docker-compose exec web rails:create
docker-compose exec web rails:migrate
```

## 詳細

### モデル

#### User

- 名前(`name`)、パスワード(`password`)を保有
- `Task`の作成、編集、削除
- `User`自身の名前、パスワードの変更、削除

#### Task

- `User`によって作成
- タイトル(`title`)、内容(`content`)、完了か否か(`is_done`)を保有
- 複数のユーザが1つの`Task`にアクセス

### 流れ

#### ユーザ登録

1. ユーザ名、パスワードを入力
2. バリデーション後、DBに追加

#### ユーザログイン

1. ユーザ名、パスワードを入力
2. DB内に同名のユーザ名が存在し、パスワードが一致していればログイン可
3. セッション内に`user_id`と`user_password`を格納

#### 認証

1. セッション内に登録されている`uesr_id`を使用し、DB内のユーザを取得
2. 1で取得したユーザのパスワードとセッション内に格納した`user_password`が一致しているか検証

### タスク作成

1. ログイン後、タスク作成画面へ遷移
2. タスク名、タスク内容を入力し、バリデーション後DBに登録

## 追記

2023/05/17 -> 認証に関して、deviseを用いた認証機能に変更しました。 PR: #13
