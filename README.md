# Movie Review

「Movie Review」は、映画を検索したり、レビューを投稿したり、好きなユーザーをフォローできるアプリです。

URL: https://movie-review.site/(サーバー停止中)

## インフラ構成図

![image](https://user-images.githubusercontent.com/57398198/77720112-4cf0ac80-702a-11ea-9622-6685b3aa82c8.png)

## 機能一覧:

### 映画

* 映画データベースAPIによる人気の映画表示機能
* タイトル・ジャンルによる検索機能
* 観たいリストに登録する機能(登録後は追加済みと表示)
* 観たいリストに登録している人数、レビューした人の人数表示機能
* 投稿された各種スコアの平均表示機能

### レビュー

* 各種スコア・タグをつけて投稿する機能(投稿後はレビュー済みと表示)
* 過去につけられた全タグを表示する機能
* 各種スコアをチャートで表示する機能
* レビューに対してGOOD,BADする機能
* タグ・各種スコア・キーワードによる検索機能
* ネタバレレビューを隠す機能

### ユーザー

* 認証機能
* 簡単ログイン機能
* プロフィール画像投稿機能
* フォロー機能
* タイムラインページ機能
* 年齢、性別、紹介文による検索機能

### その他

* GOOD/BAD数、フォロワー数、レビュー数のランキングページ機能
* ページネーション機能
* トップへ戻るボタン機能
* 非同期機能
* GOOD/BADのajax機能


## 使用技術一覧:

### 言語・FW

* ruby 2.5.7
* Rails 5.2.4.1
* Javascript / jQuery

### 開発環境

* Vagrant + VirtualBox
* Docker

### インフラ

* AWS(EC2、RDS、S3、lambda、Route53、ALB、ACM、CloudWatch)、MySQL2、Nginx(WEBサーバ)
* Capistrano

### その他gemなど

* Docker、Docker-compose(開発環境)
* Rspec(システムテスト、モデルテスト)
* Slim
* TMDb API
* I18n (日本語化)
* better_errors / binding_of_caller (エラー画面のカスタマイズ)
* devise (認証機能)
* dotenv-rails (環境変数管理)
* gon (RailsとJavascriptの連携)
* refile / refile_mini_magic (画像投稿)
* chart-js-rails (チャート表示)
* acts-as-taggable-on (タグ機能)
* data-confirm-modal (確認ダイアログカスタマイズ)
* kaminari (ページネーション)
* ransack (検索、ソート)
* bootstrap4
* font-awesome
* Rubocop (VSCodeのエクステンションで静的コード解析)
* Google Fonts
* Promiseのエラーハンドリング
