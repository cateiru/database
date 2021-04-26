-- 第3章　集約と並べ替え

-- List3-13　商品分類ごとの行数を数える

SELECT 商品分類, COUNT(*)
  FROM 商品
 GROUP BY 商品分類;
 
-- List3-14　仕入単価ごとの行数を数える

SELECT 仕入単価, COUNT(*)
  FROM 商品
 GROUP BY 仕入単価;

-- List3-15　WHERE句とGROUP BY句の併用

SELECT 仕入単価, COUNT(*)
  FROM 商品
 WHERE 商品分類 = '衣服'
 GROUP BY 仕入単価;

-- List3-16　SELECT句に集約キー以外の列名を書くとエラーになる

SELECT 商品名, 仕入単価, COUNT(*)
FROM 商品
GROUP BY 仕入単価;

-- List3-17　GROUP BY句で列の別名を使うとエラーになる

SELECT 商品分類 AS sb, COUNT(*)
FROM 商品
GROUP BY sb;

-- List3-18　商品分類ごとに行数を数える

SELECT 商品分類, COUNT(*)
FROM 商品
GROUP BY 商品分類;

-- List3-19　WHERE句に集約関数を書くとエラーになる

SELECT 商品分類, COUNT(*)
FROM 商品
WHERE COUNT(*) = 2
GROUP BY 商品分類;
