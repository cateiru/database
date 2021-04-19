-- 第2章 データベースとSQL

-- List2-1　商品テーブルから3つの列を出力

SELECT 商品ID, 商品名, 仕入単価
  FROM 商品;

-- List2-2　商品テーブルのすべての列を出力

SELECT *
  FROM 商品;

-- List2-3　List2-2と同じ意味のSELECT文

SELECT 商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日
  FROM 商品;

-- List2-4 列に別名をつける

SELECT 商品ID AS id, 商品名 AS namae, 仕入単価 AS tanka
  FROM 商品;

-- List2-5　日本語で別名をつけた

SELECT 商品ID AS 商品のコード,
       商品名 AS 商品の名前,
       仕入単価 AS 仕入れの単価
  FROM 商品;

-- List2-6　定数を出力

SELECT '商品' AS 文字列, 38 AS 数, '2009-02-24' AS 日付,
       商品ID, 商品名
  FROM 商品;

-- List2-7 DISTINCTを使って商品分類列を重複を省いた形で出力

SELECT DISTINCT 商品分類
  FROM 商品;

-- List2-8　NULLを含む列にDISTINCTキーワードをつけた場合

SELECT DISTINCT 仕入単価
  FROM 商品;

-- List2-9 複数の列の前にDISTINCTを置いた場合

SELECT DISTINCT 商品分類, 登録日
  FROM 商品;

-- List2-10　商品分類列が'衣服'の行を選択するSELECT文

SELECT 商品名, 商品分類
  FROM 商品
 WHERE 商品分類 = '衣服';

-- List2-11　検索条件の列を出力しないことも可能

SELECT 商品名
  FROM 商品
 WHERE 商品分類 = '衣服';

-- List2-12　句の記述順を勝手に変えるとエラーになる

SELECT 商品名, 商品分類
 WHERE 商品分類 = '衣服'
  FROM 商品;

-- List2-13　1行コメントの使用例

-- このSELECT文は、結果から重複をなくします。
SELECT DISTINCT 商品ID, 仕入単価
  FROM 商品;

-- List2-14　複数行コメントの使用例

/* このSELECT文は、
結果から重複をなくします。*/
SELECT DISTINCT 商品ID, 仕入単価
  FROM 商品;

-- List2-15　1行コメントをSQL文の途中に差し込む

SELECT DISTINCT 商品ID, 仕入単価
-- このSELECT文は、結果から重複をなくします。
  FROM 商品;

-- List2-16　複数行コメントをSQL文の途中に差し込む

SELECT DISTINCT 商品ID, 仕入単価
/* このSELECT文は、
結果から重複をなくします。*/
  FROM 商品;
