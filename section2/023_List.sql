-- 第2章 データベースとSQL

-- List2-30　「販売単価が1000円以上」の行を選択

SELECT 商品名, 商品分類, 販売単価
  FROM 商品
 WHERE 販売単価 >= 1000;

-- List2-31　List2-30の検索条件にNOT演算子を追加

SELECT 商品名, 商品分類, 販売単価
  FROM 商品
 WHERE NOT 販売単価 >= 1000;

-- List2-32　WHERE句の検索条件はList2-31と同値

SELECT 商品名, 商品分類, 販売単価
  FROM 商品
 WHERE 販売単価 < 1000;

-- List2-33　WHERE句の検索条件にAND演算子を使った検索

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 商品分類 = 'キッチン用品'
   AND 販売単価 >= 3000;

-- List2-34　WHERE句の検索条件にOR演算子を使った検索

SELECT 商品名, 仕入単価
  FROM 商品
 WHERE 商品分類 = 'キッチン用品'
    OR 販売単価 >= 3000;

-- List2-35　検索条件をそのまま条件式にした

SELECT 商品名, 商品分類, 登録日
  FROM 商品
 WHERE 商品分類 = '事務用品'
   AND 登録日 = '2009-09-11'
    OR 登録日 = '2009-09-20';

-- List2-36　カッコでAND演算子よりOR演算子を優先させる

SELECT 商品名, 商品分類, 登録日
  FROM 商品
 WHERE 商品分類 = '事務用品'
   AND ( 登録日 = '2009-09-11'
      OR 登録日 = '2009-09-20');
