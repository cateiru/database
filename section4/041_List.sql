-- 第4章　データの更新

-- List4-1　商品Insテーブルを作成するCREATE TABLE文

CREATE TABLE 商品Ins
    (商品ID CHAR(4) NOT NULL,
     商品名 VARCHAR(100) NOT NULL,
     商品分類 VARCHAR(32) NOT NULL,
     販売単価 INTEGER DEFAULT 0,
     仕入単価 INTEGER ,
     登録日 DATE ,
     PRIMARY KEY (商品ID));

-- List4-2　テーブルにデータを1行登録する

INSERT INTO 商品Ins (商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日)
       VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');

-- VALUES句の値リストが1列足りない！
INSERT INTO 商品Ins (商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日)
       VALUES ('0001', 'Tシャツ', '衣服', 1000, 500);

-- 挿入行の確認
SELECT * FROM 商品Ins;

-- List4-3　列リストの省略

-- 列リストあり
INSERT INTO 商品Ins (商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日) 
       VALUES ('0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15');

-- 列リストなし
INSERT INTO 商品Ins 
       VALUES ('0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15');

-- List4-4　仕入単価列にNULLを割り当てる

INSERT INTO 商品Ins (商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日) 
       VALUES ('0006', 'フォーク', 'キッチン用品', 500, NULL, '2009-09-20');

-- List4-5　商品Insテーブルを作成するCREATE TABLE文（抜粋）

CREATE TABLE 商品Ins
    (商品ID CHAR(4) NOT NULL,
     （略）
     販売単価 INTEGER DEFAULT 0, -- 販売単価のデフォルト値を0に設定
     （略）
     PRIMARY KEY (shohin_id));

-- List4-6　明示的なデフォルト値の設定

INSERT INTO 商品Ins (商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日) 
       VALUES ('0007', 'おろしがね', 'キッチン用品', DEFAULT, 790, '2009-04-28');

-- 挿入行の確認
SELECT * FROM 商品Ins WHERE 商品ID = '0007';

-- List4-7　暗黙的なデフォルト値の設定

INSERT INTO 商品Ins (商品ID, 商品名, 商品分類, 仕入単価, 登録日) 
       VALUES ('0007', 'おろしがね', 'キッチン用品', 790, '2009-04-28');
	   
-- List4-8　デフォルト値が設定されていない場合

-- 仕入単価列（制約なし）を省略：「NULL」になる
INSERT INTO 商品Ins (商品ID, 商品名, 商品分類, 販売単価, 登録日)
       VALUES ('0008', 'ボールペン', '事務用品', 100, '2009-11-11');

-- 商品名列（NOT NULL制約）を省略：エラー！
INSERT INTO 商品Ins (商品ID, 商品分類, 販売単価, 仕入単価, 登録日)
       VALUES ('0009', '事務用品', 1000, 500, '2009-12-12');

-- List4-9　商品Copyテーブルを作成するCREATE TABLE文

-- データ挿入先の商品コピーテーブル
CREATE TABLE 商品Copy
    (商品ID CHAR(4) NOT NULL,
     商品名 VARCHAR(100) NOT NULL,
     商品分類 VARCHAR(32) NOT NULL,
     販売単価 INTEGER ,
     仕入単価 INTEGER ,
     登録日 DATE ,
     PRIMARY KEY (商品ID));

-- List4-10　INSERT ... SELECT文

-- 商品テーブルのデータを商品Copyテーブルへ「コピー」
INSERT INTO 商品Copy (商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日)
SELECT 商品ID, 商品名, 商品分類, 販売単価, 仕入単価, 登録日
  FROM 商品;

-- コピー行の確認
SELECT * FROM 商品Copy;

-- List4-11　商品Bunruiテーブルを作成するCREATE TABLE文

-- 商品分類ごとにまとめたテーブル
CREATE TABLE 商品Bunrui
    (商品分類 VARCHAR(32) NOT NULL,
     販売単価合計 INTEGER ,
     仕入単価合計 INTEGER ,
     PRIMARY KEY (商品分類));

-- List4-12　ほかのテーブルのデータを集約して挿入するINSERT … SELECT文

INSERT INTO 商品Bunrui (商品分類, 販売単価合計, 仕入単価合計)
SELECT 商品分類, SUM(販売単価), SUM(仕入単価)
  FROM 商品
 GROUP BY 商品分類;

-- 挿入行の確認
SELECT * FROM 商品Bunrui;
