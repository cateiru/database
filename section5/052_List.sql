-- 第5章　複雑な問い合わせ

-- List5-8 商品合計ビューと確認用のSELECT文

-- 商品分類ごとに商品数を集計するビュー
CREATE VIEW 商品合計 (商品分類, 商品数)
AS
SELECT 商品分類, COUNT(*)
  FROM 商品
 GROUP BY 商品分類;

-- ビューが作成されていることの確認
SELECT 商品分類, 商品数
FROM 商品合計;

-- List5-9 サブクエリ

-- FROM句に直接ビュー定義のSELECT文を書く
SELECT 商品分類, 商品数
  FROM (SELECT 商品分類, COUNT(*) AS 商品数
          FROM 商品
         GROUP BY 商品分類) AS 商品合計;

-- List5-10 サブクエリの入れ子の階層を増やしてみた

SELECT 商品分類, 商品数
  FROM (SELECT *
          FROM (SELECT 商品分類, COUNT(*) AS 商品数
                  FROM 商品
                 GROUP BY 商品分類) AS 商品合計
         WHERE 商品数 = 4) AS 商品合計2;

-- List5-11 平均の販売単価を求めるスカラ・サブクエリ

SELECT AVG(販売単価)
  FROM 商品;

-- List5-12 販売単価が商品すべての平均販売単価より高い商品を選択する

SELECT 商品ID, 商品名, 販売単価
  FROM 商品
 WHERE 販売単価 > (SELECT AVG(販売単価)
                   FROM 商品);

-- List5-13 SELECT句でスカラ・サブクエリを使う

SELECT 商品ID, 
       商品名, 
       販売単価,
       (SELECT AVG(販売単価)
          FROM 商品) AS 平均単価
  FROM 商品;

-- List5-14　HAVING句でスカラ・サブクエリを使う

SELECT 商品分類, AVG(販売単価)
  FROM 商品
 GROUP BY 商品分類
HAVING AVG(販売単価) > (SELECT AVG(販売単価)
                        FROM 商品);

/* スカラ・サブクエリではないのでSELECT句に書けない（エラーになる）*/
SELECT 商品ID, 
       商品名, 
       販売単価,
       (SELECT AVG(販売単価)
          FROM 商品
         GROUP BY 商品分類) AS 平均単価
  FROM 商品;
