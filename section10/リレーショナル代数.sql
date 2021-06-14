-- リレーショナル代数

CREATE TABLE 東京商品 (
    商品ID CHAR(4) NOT NULL,
    商品名 VARCHAR(100) NOT NULL,
    商品分類 VARCHAR(32) NOT NULL,
    PRIMARY KEY (商品ID));

INSERT INTO 東京商品 VALUES ('0001', 'Tシャツ', '衣服');
INSERT INTO 東京商品 VALUES ('0002', '穴あけパンチ', '事務用品');
INSERT INTO 東京商品 VALUES ('0003', 'カッターシャツ', '衣服');
INSERT INTO 東京商品 VALUES ('0004', '包丁', 'キッチン用品');

SELECT * FROM 東京商品;

CREATE TABLE 名古屋商品 (
    商品ID CHAR(4) NOT NULL,
    商品名 VARCHAR(100) NOT NULL,
    商品分類 VARCHAR(32) NOT NULL,
    PRIMARY KEY (商品ID));

INSERT INTO 名古屋商品 VALUES ('0002', '穴あけパンチ', '事務用品');
INSERT INTO 名古屋商品 VALUES ('0003', 'カッターシャツ', '衣服');
INSERT INTO 名古屋商品 VALUES ('0006', 'フォーク', 'キッチン用品');

SELECT * FROM 名古屋商品;

CREATE TABLE 店舗数量 (
    店舗ID CHAR(4) NOT NULL,
    店舗名 VARCHAR(200),
    商品ID CHAR(4) NOT NULL,
    数量 INTEGER,
    PRIMARY KEY (店舗ID, 商品ID));

INSERT INTO 店舗数量 VALUES ('000A', '東京', '0001', 30);
INSERT INTO 店舗数量 VALUES ('000A', '東京', '0002', 50);
INSERT INTO 店舗数量 VALUES ('000B', '名古屋', '0002', 30);

SELECT * FROM 店舗数量;

-- 東京商品∪名古屋商品
SELECT * FROM 東京商品
UNION
SELECT * FROM 名古屋商品;

-- 東京商品－名古屋商品
SELECT * FROM 東京商品
EXCEPT
SELECT * FROM 名古屋商品;

-- 東京商品∩名古屋商品
SELECT * FROM 東京商品
INTERSECT
SELECT * FROM 名古屋商品;

-- 東京商品×店舗数量
SELECT *
  FROM 東京商品 CROSS JOIN 店舗数量;

-- 商品 [商品ID, 商品名]
SELECT 商品ID, 商品名 FROM 商品;

-- 商品 [商品分類]
SELECT DISTINCT 商品分類 FROM 商品;

-- 商品 [商品分類＝'事務用品']
SELECT *
  FROM 商品
 WHERE 商品分類 = '事務用品';

-- 商品 [販売単価≧仕入単価＋500]
SELECT *
  FROM 商品
 WHERE 販売単価 >= 仕入単価 + 500;

-- 東京商品 [商品ID＝商品ID] 店舗数量
SELECT *
  FROM 東京商品
  JOIN 店舗数量 ON 東京商品.商品ID = 店舗数量.商品ID;
