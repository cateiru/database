-- 第4章　データの更新

-- 商品Copyテーブルのリセット
TRUNCATE 商品Copy;

INSERT INTO 商品Copy (商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日)
SELECT 商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日
  FROM 商品;

SELECT * FROM 商品Copy;

-- List4-21　取扱商品更新トランザクション

-- SQL Server、PostgreSQL
BEGIN TRANSACTION;

    --カッターシャツの販売単価を1000円値引き
    UPDATE 商品Copy
       SET 販売単価 = 販売単価 - 1000
     WHERE 商品名 = 'カッターシャツ';

    --Tシャツの販売単価を1000円値上げ
    UPDATE 商品Copy
       SET 販売単価 = 販売単価 + 1000
     WHERE 商品名 = 'Tシャツ';

COMMIT;

SELECT * FROM 商品Copy;

-- List4-22　トランザクションをロールバックする例

--SQL Server、PostgreSQL
BEGIN TRANSACTION;

    --カッターシャツの販売単価を1000円値引き
    UPDATE 商品Copy
       SET 販売単価 = 販売単価 - 1000
     WHERE 商品名 = 'カッターシャツ';

    --Tシャツの販売単価を1000円値上げ
    UPDATE 商品Copy
       SET 販売単価 = 販売単価 + 1000
     WHERE 商品名 = 'Tシャツ';

ROLLBACK;

SELECT * FROM 商品Copy;
