-- 第7章　集合演算

-- List7-1　商品2テーブルを作成する

CREATE TABLE 商品2
 (商品ID  CHAR(4) NOT NULL,
  商品名   VARCHAR(100) NOT NULL,
  商品分類 VARCHAR(32) NOT NULL,
  販売単価 INTEGER,
  仕入単価 INTEGER,
  登録日   DATE,
  PRIMARY KEY (商品ID));

-- List7-2　商品2テーブルにデータを登録する

BEGIN TRANSACTION;

INSERT INTO 商品2 VALUES ('0001', 'Tシャツ' ,'衣服', 1000, 500, '2009-09-20');
INSERT INTO 商品2 VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11');
INSERT INTO 商品2 VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL);
INSERT INTO 商品2 VALUES ('0009', '手袋', '衣服', 800, 500, NULL);
INSERT INTO 商品2 VALUES ('0010', 'やかん', 'キッチン用品', 2000, 1700, '2009-09-20');

COMMIT;

-- List7-3 UNIONによるテーブルの足し算

SELECT 商品ID, 商品名
  FROM 商品
UNION
SELECT 商品ID, 商品名
  FROM 商品2;

-- List7-4　ORDER BY句は最後に1つだけ

SELECT 商品ID, 商品名
  FROM 商品
 WHERE 商品分類 = 'キッチン用品'
UNION
SELECT 商品ID, 商品名
  FROM 商品2
 WHERE 商品分類 = 'キッチン用品'
ORDER BY 商品ID;

-- List7-5　重複行を排除しない

SELECT 商品ID, 商品名
  FROM 商品
UNION ALL
SELECT 商品ID, 商品名
  FROM 商品2;
  
-- List7-6　INTERSECTによるテーブル共通部分の選択

SELECT 商品ID, 商品名
  FROM 商品
INTERSECT
SELECT 商品ID, 商品名
  FROM 商品2
ORDER BY 商品ID;

-- List7-7　EXCEPTによるレコードの引き算

SELECT 商品ID, 商品名
  FROM 商品
EXCEPT
SELECT 商品ID, 商品名
  FROM 商品2
ORDER BY 商品ID;

-- List7-8　どちらからどちらを引くかで結果が異なる

SELECT 商品ID, 商品名
  FROM 商品2
EXCEPT
SELECT 商品ID, 商品名
  FROM 商品
ORDER BY 商品ID;
