-- 第3章　集約と並べ替え

-- List3-20　商品分類で集約したグループから「含まれる行数が2行」のものを選択する

SELECT 商品分類, COUNT(*)
  FROM 商品
 GROUP BY 商品分類
HAVING COUNT(*) = 2;
 
-- List3-21　HAVING句なしで選択した場合

SELECT 商品分類, COUNT(*)
  FROM 商品
 GROUP BY 商品分類;

-- List3-22　HAVING句なしで選択した場合

SELECT 商品分類, AVG(販売単価)
  FROM 商品
 GROUP BY 商品分類;

-- List3-23　HAVING句で条件を設定して選択した場合

SELECT 商品分類, AVG(販売単価)
  FROM 商品
 GROUP BY 商品分類
HAVING AVG(販売単価) >= 2500;

-- List3-24　エラーになるHAVING句の使い方

SELECT 商品分類, COUNT(*)
  FROM 商品
 GROUP BY 商品分類
HAVING 商品名 = 'ボールペン';

-- List3-25　条件をHAVING句に書いた場合

SELECT 商品分類, COUNT(*)
  FROM 商品
 GROUP BY 商品分類
HAVING 商品分類 = '衣服';

-- List3--26　条件をWHERE句に書いた場合

SELECT 商品分類, COUNT(*)
  FROM 商品
 WHERE 商品分類 = '衣服'
 GROUP BY 商品分類;
 