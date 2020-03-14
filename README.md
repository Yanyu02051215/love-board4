# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

## アプリ名
【恋愛質問箱】
## アプリ概要
【恋愛に関するあらゆるお悩みを解決するQ&Aサイトです】
URL:https://love-board4.herokuapp.com/
ログイン
メールアドレス:test@test
パスワード:testtest

## 使用技術
* Ruby(2.5.3)
* Ruby on Rails(5.2.2)
* JavaScript
* jQuery
* Bootstrap
* HAML
* Rspec
* Heroku
* PostgreSQL
## 機能一覧
* 質問新規作成機能
* 質問編集・削除機能
* 質問一覧・詳細表示機能
* 質問検索機能(ransack使用)
* 質問に対する回答新規作成機能
* 回答編集・削除機能
* 回答に対する返信新規作成機能
* 返信編集機能
* ブックマーク機能(a-jax)
* パンくず機能
* ページネーション機能(kaminari使用)


# Usersテーブル
|Column|Type|Options|
|------|----|-------|
|name|string|null: false|
|gender|integer|null: false|
|age|integer|null: false|
|image|string|

### Association
- has_many :questions, dependent: :destroy
- has_many :answers, dependent: :destroy
- has_many :reactions, dependent: :destroy
- has_many :bookmarks, dependent: :destroy
- has_many :bookmark_questions, through: :bookmarks ,source: :questions


## Questionsテーブル
|Column|Type|Options|
|------|----|-------|
|title|string|null: false|
|body|string|null: false|
|category|string|null: false|
|user_id|integer|null: false, foreign_key: true|
### Association
- belongs_to :user
- has_many :answers, dependent: :destroy
- has_many :bookmarks, dependent: :destroy

## Answersテーブル
|Column|Type|Options|
|------|----|-------|
|body|string|null: false|
|is_best|boolean|default: false, null: false|
|user_id|integer|null: false, foreign_key: true|
|question_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :question
- has_many :reactions, dependent: :destroy


## Reactionsテーブル
|Column|Type|Options|
|------|----|-------|
|body|string|null: false|
|user_id|integer|null: false, foreign_key: true|
|answer_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :answer


## Bookmarksテーブル
|Column|Type|Options|
|------|----|-------|
|user_id|integer|null: false, foreign_key: true|
|question_id|integer|null: false, foreign_key: true|

### Association
- belongs_to :user
- belongs_to :question