# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

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