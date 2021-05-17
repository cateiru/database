-- 第7章　集合演算

-- List7-9　2つのテーブルを内部結合する

SELECT TS.店舗ID, TS.店舗名, TS.商品ID, S.商品名, S.販売単価
  FROM 店舗商品 AS TS INNER JOIN 商品 AS S
    ON TS.商品ID = S.商品ID
 ORDER BY TS.店舗ID;

-- 別の書き方
SELECT TS.店舗ID, TS.店舗名, TS.商品ID, S.商品名, S.販売単価
  FROM 店舗商品 AS TS, 商品 AS S
 WHERE TS.商品ID = S.商品ID
 ORDER BY TS.店舗ID;

-- List7-10　内部結合とWHERE句を組み合わせて使う

SELECT TS.店舗ID, TS.店舗名, TS.商品ID, S.商品名, S.販売単価
  FROM 店舗商品 TS INNER JOIN 商品 S
    ON TS.商品ID = S.商品ID
 WHERE TS.店舗ID = '000A';

-- 別の書き方
SELECT TS.店舗ID, TS.店舗名, TS.商品ID, S.商品名, S.販売単価
  FROM 店舗商品 TS, 商品 S
 WHERE TS.商品ID = S.商品ID
   AND TS.店舗ID = '000A';

-- List7-11　2つのテーブルを外部結合する

SELECT TS.店舗ID, TS.店舗名, S.商品ID, S.商品名, S.販売単価
  FROM 店舗商品 TS RIGHT OUTER JOIN 商品 S
    ON TS.商品ID = S.商品ID
 ORDER BY TS.店舗ID;

-- List7-12　テーブルの左右を入れ替えても外部結合の結果は同じ

SELECT TS.店舗ID, TS.店舗名, S.商品ID, S.商品名, S.販売単価
  FROM 商品 AS S LEFT OUTER JOIN 店舗商品 AS TS
    ON TS.商品ID = S.商品ID
 ORDER BY TS.店舗ID;

-- List7-13　ZaikoShohinテーブルの作成とデータ登録

-- DDL：テーブル作成
CREATE TABLE 在庫商品
( 倉庫ID		CHAR(4)      NOT NULL,
  商品ID     CHAR(4)      NOT NULL,
  在庫数量	INTEGER      NOT NULL,
  PRIMARY KEY (倉庫ID, 商品ID));

-- DML：データ登録
BEGIN TRANSACTION;

INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S001',	'0001',	0);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S001',	'0002',	120);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S001',	'0003',	200);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S001',	'0004',	3);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S001',	'0005',	0);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S001',	'0006',	99);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S001',	'0007',	999);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S001',	'0008',	200);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S002',	'0001',	10);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S002',	'0002',	25);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S002',	'0003',	34);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S002',	'0004',	19);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S002',	'0005',	99);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S002',	'0006',	0);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S002',	'0007',	0);
INSERT INTO 在庫商品 (倉庫ID, 商品ID, 在庫数量) VALUES ('S002',	'0008',	18);

COMMIT;

-- List7-14　3つのテーブルを内部結合する

SELECT TS.店舗ID, TS.店舗名, TS.商品ID, S.商品名, S.販売単価, ZS.在庫数量
  FROM 店舗商品 AS TS INNER JOIN 商品 AS S
    ON TS.商品ID = S.商品ID
          INNER JOIN 在庫商品 AS ZS
             ON TS.商品ID = ZS.商品ID
 WHERE ZS.倉庫ID = 'S001'
 ORDER BY TS.店舗ID;

-- 別の書き方
SELECT TS.店舗ID, TS.店舗名, TS.商品ID, S.商品名, S.販売単価, ZS.在庫数量
  FROM 店舗商品 AS TS, 商品 AS S, 在庫商品 AS ZS
 WHERE TS.商品ID = S.商品ID
   AND TS.商品ID = ZS.商品ID
   AND ZS.倉庫ID = 'S001'
 ORDER BY TS.店舗ID;

-- List7-15　2つのテーブルをクロス結合する

SELECT TS.店舗ID, TS.店舗名, TS.商品ID, S.商品名
  FROM 店舗商品 AS TS CROSS JOIN 商品 AS S;

-- 別の書き方
SELECT TS.店舗ID, TS.店舗名, TS.商品ID, S.商品名
  FROM 店舗商品 AS TS, 商品 AS S;

-- List7-16　古い構文を使った内部結合（List7-10再掲）

SELECT TS.店舗ID, TS.店舗名, TS.商品ID, S.商品名, S.販売単価
  FROM 店舗商品 TS INNER JOIN 商品 S
    ON TS.商品ID = S.商品ID
 WHERE TS.店舗ID = '000A';

