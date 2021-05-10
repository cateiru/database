-- 第5章　複雑な問い合わせ

-- List5-1　ビューならSELECT文だけを保存すれば良い

SELECT 商品分類, COUNT(*)
  FROM 商品
 GROUP BY 商品分類;

-- List5-2 商品合計ビュー

CREATE VIEW 商品合計 (商品分類, 商品数)
AS
SELECT 商品分類, COUNT(*)
  FROM 商品
 GROUP BY 商品分類;

-- List5-3 ビューを使う

SELECT 商品分類, 商品数
  FROM 商品合計;
  
-- List5-4 商品合計事務ビュー

CREATE VIEW 商品合計事務 (商品分類, 商品数)
AS
SELECT 商品分類, 商品数
  FROM 商品合計
 WHERE 商品分類 = '事務用品';

-- ビューが作成されていることの確認
SELECT 商品分類, 商品数
  FROM 商品合計事務;

-- List5-5 更新可能なビュー

CREATE VIEW 商品事務 (商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日)
AS 
SELECT *
  FROM 商品
 WHERE 商品分類 = '事務用品';

-- List5-6 ビューに行を追加

INSERT INTO 商品事務 VALUES ('0009', '印鑑', '事務用品', 95, 10, '2009-11-30');

-- ビューに追加されていることの確認
SELECT * FROM 商品事務;

-- 元のテーブルに追加されていることの確認
SELECT * FROM 商品;

-- List5-７　ビューの削除

DROP VIEW 商品合計;
