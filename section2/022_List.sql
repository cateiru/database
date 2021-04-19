-- 第2章 データベースとSQL

-- List2-17　SQL文には計算式も書ける

SELECT 商品名, 販売単価,
       販売単価 * 2 AS "販売単価_x2"
  FROM 商品;

-- List2-18　販売単価列が500の行を選択

SELECT 商品名, 商品分類
  FROM 商品
 WHERE 販売単価 = 500;

-- List2-19　販売単価列が500ではない行を選択

SELECT 商品名, 商品分類
  FROM 商品
 WHERE 販売単価 <> 500;

-- List2-20　販売単価が1000円以上の行を選択

SELECT 商品名, 商品分類, 販売単価
  FROM 商品
 WHERE 販売単価 >= 1000;

-- List2-21　登録日が2009年9月27日より前の行を選択

SELECT 商品名, 商品分類, 登録日
  FROM 商品
 WHERE 登録日 < '2009-09-27';

-- List2-22　WHERE句の条件式にも計算式を書ける

SELECT 商品名, 販売単価, 仕入単価
  FROM 商品
 WHERE 販売単価 - 仕入単価 >= 500;

-- List2-23　Charsテーブルの作成とデータの登録

-- DDL：テーブル作成
CREATE TABLE Chars
  (chr CHAR(3) NOT NULL,
   PRIMARY KEY (chr));

-- DML：データ登録
BEGIN TRANSACTION;
  INSERT INTO Chars VALUES ('1');
  INSERT INTO Chars VALUES ('2');
  INSERT INTO Chars VALUES ('3');
  INSERT INTO Chars VALUES ('10');
  INSERT INTO Chars VALUES ('11');
  INSERT INTO Chars VALUES ('222');
COMMIT;

-- List2-24　'2'より大きいデータを選択するSELECT文

SELECT chr
  FROM Chars
 WHERE chr > '2';

-- List2-25　仕入単価が2800円の行を選択

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 = 2800;

-- List2-26　仕入単価が2800円ではない行を選択

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 <> 2800;
 
-- List2-27　間違ったSELECT文（1行も選択されない）

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 = NULL;

-- List2-28　NULLである行を選択

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 IS NULL;

-- List2-29　NULLではない行を選択

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 仕入単価 IS NOT NULL;
