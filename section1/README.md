# 1回目

## 目的

データベースを学ぶ。

## 評価方法

演習:レポート = 3:7

## 使用Database

PostgreSQL

### PostgreSQL is 何？

- カリフォルニア大学バークレイ校のCS学科で開発された。
- オブジェクトリレーションデータベース管理システム。
- OSS
- 標準SQLの大部分をサポートしている。

### PostgreSQL インストール

```bash
# postgreSQL
brew install postgresql

# PgAdmin4
brew install pgadmin4 --cask
```

[PGAdmin4の日本語化](https://qiita.com/sanapuuu/items/4e43f6ed0cf0a597efb5)

### PostgreSQL の起動停止

```bash
# macOS の場合
# 起動
brew services start postgresql

# 停止
brew services stop postgresql

# 起動しているSQLの確認
brew services list
```

### データベース内に入る

```bash
# データベース一覧を表示
psql -l

# 指定したデータベースに入る
psql 入りたいデータベース名

# 一覧表示
> \dt

# データベースの削除
> drop database 削除したいデータベース名

# データベースから抜ける
> \q
```