-- 第6章　関数、述語、CASE式

-- List6-1　SampleMathテーブルを作成する

-- DDL：テーブル作成
CREATE TABLE SampleMath
 (m NUMERIC (10,3),
  n INTEGER,
  p INTEGER);

-- DML：データ登録
BEGIN TRANSACTION;
INSERT INTO SampleMath(m, n, p) VALUES (500, 0, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (-180, 0, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, NULL, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 7, 3);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 5, 2);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 4, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (8, NULL, 3);
INSERT INTO SampleMath(m, n, p) VALUES (2.27, 1, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (5.555,2, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (NULL, 1, NULL);
INSERT INTO SampleMath(m, n, p) VALUES (8.76, NULL, NULL);
COMMIT;

-- 確認
SELECT * FROM SampleMath;

-- List6-2 数値の絶対値を求める

SELECT m, ABS(m) AS abs_col
  FROM SampleMath;

-- List6-3 割り算（n÷p）の余りを求める

SELECT n, p, MOD(n, p) AS mod_col
  FROM SampleMath;

-- List6-4 m列の数値をn列の丸め桁数で四捨五入する

SELECT m, n, ROUND(m, n) AS round_col
  FROM SampleMath;

-- List6-5 SampleStrテーブルを作成する

-- DDL：テーブル作成
CREATE TABLE SampleStr
 (str1 VARCHAR(40),
  str2 VARCHAR(40),
  str3 VARCHAR(40));

-- DML：データ登録
BEGIN TRANSACTION;
INSERT INTO SampleStr (str1, str2, str3) VALUES ('あいう', 'えお', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc', 'def', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('山田', '太郎', 'です');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('aaa', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES (NULL, 'あああ', NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('@!#$%', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('ABC', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('aBC', NULL, NULL);
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abc太郎', 'abc', 'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('abcdefabc', 'abc', 'ABC');
INSERT INTO SampleStr (str1, str2, str3) VALUES ('ミックマック', 'ッ', 'っ');
COMMIT;

-- 確認
SELECT * FROM SampleStr;

-- List6-6 2つの文字列をつなげる（str1＋str2）

SELECT str1, str2, str1 || str2 AS str_concat
  FROM SampleStr;

-- List6-7　3つの文字列をつなげる（str1＋str2＋str3）

SELECT str1, str2, str3, str1 || str2 || str3 AS str_concat
  FROM SampleStr
 WHERE str1 = '山田';

-- List6-8 文字列の長さを調べる

SELECT str1, LENGTH(str1) AS len_str
  FROM SampleStr;

-- List6-9 大文字を小文字に

SELECT str1, LOWER(str1) AS low_str
  FROM SampleStr
 WHERE str1 IN ('ABC', 'aBC', 'abc', '山田');

-- List6-10 文字列の一部を置き換える

SELECT str1, str2, str3, REPLACE(str1, str2, str3) AS rep_str
  FROM SampleStr;

-- List6-11 文字列の左から3番目と4番目の文字を抜き出す

SELECT str1, SUBSTRING(str1 FROM 3 FOR 2) AS sub_str
  FROM SampleStr;

-- List6-12 小文字を大文字に

SELECT str1, UPPER(str1) AS up_str
  FROM SampleStr
 WHERE str1 IN ('ABC', 'aBC', 'abc', '山田');

-- List6-13 現在の日付を取得する

SELECT CURRENT_DATE;

-- List6-14 現在の時間を取得する

SELECT CURRENT_TIME;

-- List6-15 現在の日時を取得する

SELECT CURRENT_TIMESTAMP;

-- List6-16 日付要素を切り出す

SELECT CURRENT_TIMESTAMP,
       EXTRACT(YEAR   FROM CURRENT_TIMESTAMP) AS year,
       EXTRACT(MONTH  FROM CURRENT_TIMESTAMP) AS month,
       EXTRACT(DAY    FROM CURRENT_TIMESTAMP) AS day,
       EXTRACT(HOUR   FROM CURRENT_TIMESTAMP) AS hour,
       EXTRACT(MINUTE FROM CURRENT_TIMESTAMP) AS minute,
       EXTRACT(SECOND FROM CURRENT_TIMESTAMP) AS second;

-- List6-17　文字型から数値型への変換

SELECT CAST('0001' AS INTEGER) AS int_col;

-- List6-18 文字型から日付型への変換

SELECT CAST('2009-12-14' AS DATE) AS date_col;

-- List6-19 NULLを値に変換する

SELECT COALESCE(NULL, 1) AS col_1,
       COALESCE(NULL, 'test', NULL) AS col_2,
       COALESCE(NULL, NULL, '2009-11-01') AS col_3;

-- List6-20 SampleStrテーブルの列を使ったサンプル

SELECT COALESCE(str2, 'NULLです')
  FROM SampleStr;
