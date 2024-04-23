# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :dishes
- has_many :room, through: :room_users
- has_many :messages

## dishes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| dish        | string     |                                |
| category_id | integer | null: false, foreign_key: true |
| remark      | text | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user

## menus テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| date  | string     |                                |
| dish1 | references | null: false, foreign_key: true |
| dish2 | references | null: false, foreign_key: true |
| dish3 | references | null: false, foreign_key: true |


### Association

- belongs_to :room
- belongs_to :user

## menu_dishes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| menu   | references | null: false, foreign_key: true |
| dish   | references | null: false, foreign_key: true |

### Association

- belongs_to :room
- belongs_to :user


# アプリケーション名
konkon-kondate

# アプリケーション概要
# URL
# テスト用アカウント
# 利用方法
# アプリケーションを作成した背景
# 実装した機能について画像やGIFおよびその説明
# 実装予定の機能
# データベース設計
[![Image from Gyazo](https://i.gyazo.com/c6c36b492f49f71879a7c6d8e8a4fa8f.png)](https://gyazo.com/c6c36b492f49f71879a7c6d8e8a4fa8f)

# 画面遷移図
# 開発環境
# ローカルでの動作方法
# 工夫したポイント
# 改善点
# 制作時間
