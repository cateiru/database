-- 第4章　データの更新

-- List4-13　商品Copyテーブルを空っぽにする

DELETE FROM 商品Copy;

-- 削除結果の確認
SELECT * FROM 商品Copy;

-- 商品テーブルのデータを商品Copyテーブルへ「コピー」
INSERT INTO 商品Copy (商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日)
SELECT 商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日
  FROM 商品;

-- List4-14　販売単価が4000円以上の行だけを削除

DELETE FROM 商品Copy
 WHERE 販売単価 >= 4000;

-- 削除結果の確認
SELECT * FROM 商品Copy;
