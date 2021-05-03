# 4回目 データの更新

## insert

データの登録

```sql
INSERT INTO 商品(商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日) VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20')
```

- 列リストの並び順は任意
- 列リストと値リストは1:1
- 列リスト全体は省略可能
- テーブルへの挿入は行単位

- Nullの場合はNULL
- Defaultの場合はDEFAULT

### 既存テーブルから

```sql
insert into 商品新(商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日) SELECT 商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日 FROM 商品;
```

### 新規テーブル作成と挿入

```sql
CREATE TABLE 商品新 AS SELECT 商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日 FROM 商品;
```

## Delete

```sql
delete from 商品 where 商品ID='00001'
```

- where句の扱い＝select
- テーブルからの削除は行単位
- 全削除

  ```sql
  truncate 商品;
  ```

## Update

```sql
update 商品 set 商品名='Yシャツ' where 商品ID='0001';
```

- データの更新
- null, defaultへの変更→NULL, DEFAULTを
- where句の扱い＝select
- テーブル更新は行単位

## トランザクション

### ACID特性、隔離性水準

- 原始性
  - Only commit or rollback
- 一貫性or整合性
- 独立性or隔離性
- 永続性or耐久性

### PostgreSQLにおけるトランザクション

- 自動コミットモード
  - 個々のSQL文を1つのトランザクションとして実行
  - 実行が成功→更新結果の取消不可
- 手動コミットモード
  - 複数のSQL文をまとめて1つのトランザクションとして実行
  - `begin transaction`→トランザクションの開始
  - `commit`→更新結果の確定
  - `rollback`→更新結果が取り消し
