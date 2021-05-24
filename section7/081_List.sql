-- 第8章　SQLで高度な処理を行う

-- List8-1 商品分類別に、販売単価の安い順で並べたランキング表を作る

SELECT 商品名, 商品分類, 販売単価,
       RANK () OVER (PARTITION BY 商品分類
                         ORDER BY 販売単価) AS ランキング
  FROM 商品;

-- List8-2 PARTITION BYを指定しない場合

SELECT 商品名, 商品分類, 販売単価,
       RANK () OVER (ORDER BY 販売単価) AS ランキング
  FROM 商品;

-- List8-3 RANK、DENSE_RANK、ROW_NUMBERの結果を比較

SELECT 商品名, 商品分類, 販売単価,
       RANK () OVER (ORDER BY 販売単価) AS RANK,
       DENSE_RANK () OVER (ORDER BY 販売単価) AS DENSE_RANK,
       ROW_NUMBER () OVER (ORDER BY 販売単価) AS ROW_NUMBER
  FROM 商品;

-- List8-4 SUM関数をウィンドウ関数として使う﻿

SELECT 商品ID, 商品名, 販売単価,
       SUM (販売単価) OVER (ORDER BY 商品ID) AS 累計
  FROM 商品;

-- List8-5 AVG関数をウィンドウ関数として使う﻿

SELECT 商品ID, 商品名, 販売単価,
       AVG (販売単価) OVER (ORDER BY 商品ID) AS 現在平均
  FROM 商品;

-- List8-6 集計対象のレコードを「直近の3行」にする

SELECT 商品ID, 商品名, 販売単価,
       AVG (販売単価) OVER (ORDER BY 商品ID
                                ROWS 2 PRECEDING) AS 移動平均
  FROM 商品;

-- List8-7 カレントレコードの前後の行を集計対象に含める

SELECT 商品ID, 商品名, 販売単価,
       AVG (販売単価) OVER (ORDER BY 商品ID
                                 ROWS BETWEEN 1 PRECEDING AND 
                                              1 FOLLOWING) AS 移動平均
  FROM 商品;

-- List8-8 このSELECT文の結果の並び順は保証されない

SELECT 商品ID, 商品名, 販売単価,
       RANK () OVER (ORDER BY 販売単価) AS ランキング
  FROM 商品;

-- List8-9 文末のORDER BY句によって結果の並び順が保証される

SELECT 商品名, 商品分類, 販売単価,
       RANK () OVER (ORDER BY 販売単価) AS ランキング
  FROM 商品
 ORDER BY ランキング;
