

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
https://konkon-kondate.onrender.com

# テスト用アカウント
- Basic認証ID : admin
- Basic認証パスワード : 5555
- メールアドレス : aaa@aaa
- パスワード : 111111

# 利用方法
- 料理名をカテゴリー毎に登録する
- 日付を選択し、その日に作る料理を登録する

# アプリケーションを作成した背景
- 日々の食事作りで、夕方になると疲れてしまい、夕食のメニューが中々決まらず困っていた。
- 昼間はまだ疲れておらず、何を作るか考えるのにすぐにアイデアが浮かぶが、夕方になると判断力が鈍り、献立を決めるのに時間がかかってしまう。
- 献立を決める際に余裕のある時にはすぐに決まるが、その後覚えておらず、次回以降も同じ問題が繰り返される。
このような問題を解決するために、食事の献立を事前に記録し、夕方になっても迷わずにすぐにメニューを決められるようなアプリケーションを作成した。

# 実装した機能について画像やGIFおよびその説明
- 料理名登録機能
　Topページ → 登録済み料理一覧 → 新規登録する
　定番料理、作ったことのある料理を登録する。
[![Image from Gyazo](https://i.gyazo.com/c096723c09068516ec3ab56aef09075d.png)](https://gyazo.com/c096723c09068516ec3ab56aef09075d)

# 実装予定の機能
- こんだて登録機能
　1日3品まで登録できる。
　カレンダーから（最近作った物を見ながらかぶらないように）、登録済み料理一覧から（作れる料理を見ながら）のどちらからも登録できるようにする。
[![Image from Gyazo](https://i.gyazo.com/11b64f49a171fcf69235feae9f46c61c.png)](https://gyazo.com/11b64f49a171fcf69235feae9f46c61c)

- こんだて登録の際、カテゴリー別に料理名が表示される（2段階プルダウン）
- こんだて登録後、料理名表示がカテゴリー毎に色分けされて表示（マンネリ化回避）

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
| user   | references | null: false, foreign_key: true |
| date   | string     |                                |
| dish1  | references | null: false, foreign_key: true |
| dish2  | references | null: false, foreign_key: true |
| dish3  | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_many :dishes, through: :menu_dishes

## dishes テーブル

| Column      | Type       | Options                        |
| ----------- | ---------- | ------------------------------ |
| user        | references | null: false, foreign_key: true |
| dish        | string     | null: false                    |
| category_id | integer    | null: false, foreign_key: true |
| remark      | text       |                                |

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
- フロントエンド　HTML, CSS
- バックエンド　Ruby on Rails 7.0.0, mySQL, PostgreSQL
- インフラ　Render
- テスト　rspec
- テキストエディタ　VSCode
- タスク管理　GitHub

# ローカルでの動作方法
以下のコマンドを順に実行。  
% git clone https://github.com/maeda88/konkon-kondate.git  
% cd konkon-kondate  
% bundle install  
% rails db:create  
% rails db:migrate  
% rails s  

# 工夫したポイント
- 登録済み料理一覧をプルダウンで選択、いちいち料理名を打ち込まなくても短時間で登録できる
- 登録済み料理一覧にメモ機能を実装、レシピのURLやコツ等を登録・蓄積できる

# 改善点

# 制作時間
