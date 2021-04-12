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

## PostgreSQL インストール

```bash
# postgreSQL
brew install postgresql

# PgAdmin4
brew install pgadmin4 --cask
```

[PGAdmin4の日本語化](https://qiita.com/sanapuuu/items/4e43f6ed0cf0a597efb5)

## PostgreSQL の起動停止

```bash
# macOS の場合
# 起動
brew services start postgresql

# 停止
brew services stop postgresql

# 起動しているSQLの確認
brew services list
```

## データベース内に入る

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

## 新しくデータベースを作成する、削除する

```bash
# 追加
createdb [db name] -O postgres

# 削除
dropdb [db name]
```

## サーバーを起動してクライアントから開く

1. [PostgreSQL の起動](#PostgreSQL%20の起動停止)
2. `psql -l`でユーザー名確認

   ```bash
    ~/G/database ❯❯❯ psql -l

     List of databases
     Name    | Owner  | Encoding | Collate | Ctype | Access privileges
     -----------+--------+----------+---------+-------+-------------------
    postgres  | yuto_w | UTF8     | C       | C     |
    template0 | yuto_w | UTF8     | C       | C     | =c/yuto_w        +
              |        |          |         |       | yuto_w=CTc/yuto_w
    template1 | yuto_w | UTF8     | C       | C     | =c/yuto_w        +
              |        |          |         |       | yuto_w=CTc/yuto_w
    (3 rows)
    ```

  owner
3. PgAdmin4から以下のように設定し起動
  ![image](スクリーンショット%202021-04-12%2019.10.36.png)
