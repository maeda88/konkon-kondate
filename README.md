

# アプリケーション名
konkon-kondate

# アプリケーション概要
### 夕食のメニューを登録できるアプリです
- すでに作れる料理を登録
- 登録した料理をいつ作るか、1週間の予定にいれていく
- 料理はカテゴリー毎に登録する
### 解決したい課題
- 異なるカテゴリーを組み合わせることにより、マンネリ化を回避できる
- 何も見ずに作れる作れる料理はたくさんあるが、パッと思い出せない

# URL
# テスト用アカウント

# 利用方法
- 料理名をカテゴリー毎に登録する
- 日付を選択し、その日に作る料理を登録する

# アプリケーションを作成した背景
- 日々の食事作りで、夕方になると疲れてしまい、夕食のメニューが中々決まらず困っていた。
- 昼間はまだ疲れておらず、何を作るか考えるのにすぐにアイデアが浮かぶが、夕方になると判断力が鈍り、献立を決めるのに時間がかかってしまう。
- 献立を決める際に余裕のある時にはすぐに決まるが、その後覚えておらず、次回以降も同じ問題が繰り返される。
このような問題を解決するために、食事の献立を事前に記録し、夕方になっても迷わずにすぐにメニューを決められるようなアプリケーションを作成した。

# 実装した機能について画像やGIFおよびその説明
- 1週間のこんだて登録画面
[![Image from Gyazo](https://i.gyazo.com/e719ea82f0ec9107864e36cf41b53e9e.png)](https://gyazo.com/e719ea82f0ec9107864e36cf41b53e9e)

# 実装予定の機能

# データベース設計
[![Image from Gyazo](https://i.gyazo.com/c6c36b492f49f71879a7c6d8e8a4fa8f.png)](https://gyazo.com/c6c36b492f49f71879a7c6d8e8a4fa8f)

# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| name               | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |

### Association

- has_many :dishes
- has_many :menues

## menus テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| date   | string     |                                |
| dish1  | references | null: false, foreign_key: true |
| dish2  | references | null: false, foreign_key: true |
| dish3  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :dishes, through: :menu_dishes

## dishes テーブル

| Column      | Type    | Options                        |
| ----------- | ------- | ------------------------------ |
| dish        | string  | null: false                    |
| category_id | integer | null: false, foreign_key: true |
| remark      | text    |                                |

### Association

- belongs_to :user
- has_many :menus, through: :menu_dishes

## menu_dishes テーブル

| Column | Type       | Options                        |
| ------ | ---------- | ------------------------------ |
| menu   | references | null: false, foreign_key: true |
| dish   | references | null: false, foreign_key: true |

### Association

- belongs_to :menu
- belongs_to :dish

# 画面遷移図
[![Image from Gyazo](https://i.gyazo.com/e4c4b4f9c297b95097a860393aa327fe.png)](https://gyazo.com/e4c4b4f9c297b95097a860393aa327fe)

# 開発環境
# ローカルでの動作方法
# 工夫したポイント
# 改善点
# 制作時間
