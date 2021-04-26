-- 第3章　集約と並べ替え

-- List3-1　全行を数える

SELECT COUNT(*)
  FROM 商品;

-- List3-2　NULLを除外して数える

SELECT COUNT(仕入単価)
  FROM 商品;

-- List3-3　NULLを含む列を引数にした場合、COUNT(*)とCOUNT(<列名>)の結果は異なる

SELECT COUNT(*), COUNT(仕入単価)
FROM 商品;

-- List3-4　販売単価の合計を求める

SELECT SUM(販売単価)
  FROM 商品;

-- List3-5　販売単価と仕入単価の合計を求める

SELECT SUM(販売単価), SUM(仕入単価)
FROM 商品;

-- List3-6　販売単価の平均値を求める

SELECT AVG(販売単価)
FROM 商品;
  
-- List3-7　販売単価と仕入単価の平均値を求める

SELECT AVG(販売単価), AVG(仕入単価)
  FROM 商品;

-- List3-8　販売単価の最大値、仕入単価の最小値を求める

SELECT MAX(販売単価), MIN(仕入単価)
FROM 商品;

-- List3-9　登録日の最大値・最小値を求める

SELECT MAX(登録日), MIN(登録日)
  FROM 商品;

-- List3-10　値の重複を除いて行数を数える

SELECT COUNT(DISTINCT 商品分類)
FROM 商品;

-- List3-11　行数を数えてから値の重複を除くことになる

SELECT DISTINCT COUNT(商品分類)
FROM 商品;

-- List3-12　DISTINCTの有無による動作の違い（SUM関数）

SELECT SUM(販売単価), SUM(DISTINCT 販売単価)
  FROM 商品;
