-- 第6章　関数、述語、CASE式

-- List6-21　SampleLikeテーブルを作成する

-- DDL：テーブル作成
CREATE TABLE SampleLike
( strcol VARCHAR(6) NOT NULL,
  PRIMARY KEY (strcol));

-- DML：データ登録
BEGIN TRANSACTION;

INSERT INTO SampleLike (strcol) VALUES ('abcddd');
INSERT INTO SampleLike (strcol) VALUES ('dddabc');
INSERT INTO SampleLike (strcol) VALUES ('abdddc');
INSERT INTO SampleLike (strcol) VALUES ('abcdd');
INSERT INTO SampleLike (strcol) VALUES ('ddabc');
INSERT INTO SampleLike (strcol) VALUES ('abddc');

COMMIT;

-- 確認
SELECT * FROM SampleLike;

-- List6-22 LIKEによる前方一致検索

SELECT *
  FROM SampleLike
 WHERE strcol LIKE 'ddd%';

-- List6-23 LIKEによる中間一致検索

SELECT *
  FROM SampleLike
 WHERE strcol LIKE '%ddd%';

-- List6-24 LIKEによる後方一致検索

SELECT *
  FROM SampleLike
 WHERE strcol LIKE '%ddd';

-- List6-25 LIKEと_（アンダーバー）による後方一致

SELECT *
  FROM SampleLike
 WHERE strcol LIKE 'abc__';

-- List6-26　「abc＋任意の3文字」を検索

SELECT *
  FROM SampleLike
 WHERE strcol LIKE 'abc___';

-- List6-27　販売単価が100～1000円の商品を選択

SELECT 商品名, 販売単価
  FROM 商品
 WHERE 販売単価 BETWEEN 100 AND 1000;

-- List6-28 販売単価が101～999円の商品を選択

SELECT 商品名, 販売単価
  FROM 商品
  WHERE 販売単価 > 100 AND 販売単価 < 1000;

-- List6-29 仕入単価がNULLの商品を選択

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 IS NULL;

-- List6-30 仕入単価がNULL以外の商品を選択

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 IS NOT NULL;

-- List6-31 ORで複数の仕入単価を指定して検索

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 = 320 OR 仕入単価 = 500 OR 仕入単価 = 5000;

-- List6-32 INで複数の仕入単価を指定して検索

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 IN (320, 500, 5000);

-- List6-33 NOT INで検索時に除外する仕入単価を複数指定して検索

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 NOT IN (320, 500, 5000);

-- List6-34 商品店舗テーブルを作成するCREATE TABLE文

CREATE TABLE 店舗商品
(店舗ID  CHAR(4)     NOT NULL,
 店舗名  VARCHAR(200) NOT NULL,
 商品ID  CHAR(4)     NOT NULL,
 数量   INTEGER      NOT NULL,
 PRIMARY KEY (店舗ID, 商品ID));

-- List6-35 商品店舗テーブルにデータを登録するINSERT文

BEGIN TRANSACTION;

INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000A', '東京', '0001', 30);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000A', '東京', '0002', 50);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000A', '東京', '0003', 15);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000B', '名古屋', '0002', 30);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000B', '名古屋', '0003', 120);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000B', '名古屋', '0004', 20);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000B', '名古屋', '0006', 10);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000B', '名古屋', '0007', 40);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000C', '大阪', '0003', 20);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000C', '大阪', '0004', 50);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000C', '大阪', '0006', 90);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000C', '大阪', '0007', 70);
INSERT INTO 店舗商品 (店舗ID, 店舗名, 商品ID, 数量) VALUES ('000D', '福岡', '0001', 100);

COMMIT;

-- List6-36　INの引数にサブクエリを使う

-- 「大阪店に置いてある商品の販売単価」を求める
SELECT 商品名, 販売単価
  FROM 商品
 WHERE 商品ID IN (SELECT 商品ID
                   FROM 店舗商品
                  WHERE 店舗ID = '000C');

-- List6-37　NOT INの引数にサブクエリを使う

SELECT 商品名, 販売単価
  FROM 商品
 WHERE 商品ID NOT IN (SELECT 商品ID
                       FROM 店舗商品
                      WHERE 店舗ID = '000A');

-- List6-38　EXISTSで「大阪店に置いてある商品の販売単価」を求める

SELECT 商品名, 販売単価
  FROM 商品 AS S
 WHERE EXISTS (SELECT *
                 FROM 店舗商品 AS TS
                WHERE TS.店舗ID = '000C' AND TS.商品ID = S.商品ID);

-- List6-39　こう書いてもList6-38と同じ

SELECT 商品名, 販売単価
  FROM 商品 AS S
 WHERE EXISTS (SELECT 1 -- ここは適当な定数を書いてもかまいません
                 FROM 店舗商品 AS TS
                WHERE TS.店舗ID = '000C' AND TS.商品ID = S.商品ID);

-- List6-40　NOT EXISTSで「東京店に置いてある商品“以外”の販売単価」を求める

SELECT 商品名, 販売単価
  FROM 商品 AS S
 WHERE NOT EXISTS (SELECT *
                     FROM 店舗商品 AS TS
                    WHERE TS.店舗ID = '000C' AND TS.商品ID = S.商品ID);
