-- 第3章　集約と並べ替え

-- List3-27　商品ID、商品名、販売単価、仕入単価を表示するSELECT文

SELECT 商品ID, 商品名, 販売単価, 仕入単価
  FROM 商品;
 
-- List3-28　販売単価の低い順（昇順）に並べる

SELECT 商品ID, 商品名, 販売単価, 仕入単価
  FROM 商品
 ORDER BY 販売単価;
 
-- List3-29　販売単価の高い順（降順）に並べる

SELECT 商品ID, 商品名, 販売単価, 仕入単価
  FROM 商品
 ORDER BY 販売単価 DESC;
 
-- List3-30　販売単価と商品IDの昇順に並べる

SELECT 商品ID, 商品名, 販売単価, 仕入単価
  FROM 商品
 ORDER BY 販売単価, 商品ID;
 
-- List3-31　仕入単価の昇順に並べる

SELECT 商品ID, 商品名, 販売単価, 仕入単価
  FROM 商品
 ORDER BY 仕入単価;

-- List3-32　ORDER BY句では列の別名が使える

SELECT 商品ID AS id, 商品名, 販売単価 AS ht, 仕入単価
  FROM 商品
 ORDER BY ht, id;
 
-- List3-33　SELECT句に含まれていない列もORDER RY句に指定できる

SELECT 商品名, 販売単価, 仕入単価
  FROM 商品
ORDER BY 商品ID;

-- List3-34　集約関数もORDER BY句で利用可能

SELECT 商品分類, COUNT(*)
  FROM 商品
 GROUP BY 商品分類
 ORDER BY COUNT(*);
 
-- List3-35 ORDER BY句では列番号を指定できる

-- 列名で指定
SELECT 商品ID, 商品名, 販売単価, 仕入単価
  FROM 商品
ORDER BY 販売単価 DESC, 商品ID;

-- 列番号で指定
SELECT 商品ID, 商品名, 販売単価, 仕入単価
  FROM 商品
ORDER BY 3 DESC, 1;
