-- 第1章 データベースとSQL

-- List1-1　shopデータベースを作成するCREATE DATABASE文

CREATE DATABASE shop;

-- List1-2　商品テーブルを作成するCREATE TABLE文

CREATE TABLE 商品 (
    商品ID CHAR(4) NOT NULL,
    商品名 VARCHAR(100) NOT NULL,
    商品分類 VARCHAR(32) NOT NULL,
    販売単価 INTEGER,
    仕入単価 INTEGER,
    登録日 DATE,
    PRIMARY KEY (商品ID));

-- List1-3　商品テーブルを削除

DROP TABLE 商品;

-- List1-4　100けたの可変長文字列を入れる商品名カナ列を追加

ALTER TABLE 商品 ADD COLUMN 商品名カナ VARCHAR(100);

-- List1-5 List1-5　shohin_mei_kana列を削除

ALTER TABLE 商品 DROP COLUMN 商品名カナ;

-- List1-6 商品テーブルにデータを登録するSQL文

BEGIN TRANSACTION;
INSERT INTO 商品 VALUES ('0001', 'Tシャツ', '衣服', 1000, 500, '2009-09-20');
INSERT INTO 商品 VALUES ('0002', '穴あけパンチ', '事務用品', 500, 320, '2009-09-11');
INSERT INTO 商品 VALUES ('0003', 'カッターシャツ', '衣服', 4000, 2800, NULL);
INSERT INTO 商品 VALUES ('0004', '包丁', 'キッチン用品', 3000, 2800, '2009-09-20');
INSERT INTO 商品 VALUES ('0005', '圧力鍋', 'キッチン用品', 6800, 5000, '2009-01-15');
INSERT INTO 商品 VALUES ('0006', 'フォーク', 'キッチン用品', 500, NULL, '2009-09-20');
INSERT INTO 商品 VALUES ('0007', 'おろしがね', 'キッチン用品', 880, 790, '2008-04-28');
INSERT INTO 商品 VALUES ('0008', 'ボールペン', '事務用品', 100, NULL, '2009-11-11');
COMMIT;

-- List2-2　商品テーブルのすべての列を出力

SELECT * FROM 商品;
