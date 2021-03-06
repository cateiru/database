-- 商品仕入テーブル作成

CREATE TABLE 商品仕入 (
    商品ID CHAR(4) NOT NULL,
    商品名 VARCHAR(100) NOT NULL,
    商品分類 VARCHAR(32) NOT NULL,
    仕入単価 INTEGER,
    業者ID CHAR(4) NOT NULL,
    業者名 VARCHAR(100) NOT NULL,
    PRIMARY KEY (商品ID));

INSERT INTO 商品仕入 (商品ID,商品名,商品分類,仕入単価,業者ID,業者名) VALUES
    ('0001', 'Tシャツ', '衣服', 500, '1010', '千住工業'),
    ('0002', '穴あけパンチ', '事務用品', 320, '2020', '旭商会'),
    ('0003', 'カッターシャツ', '衣服', 2800, '1010', '千住工業'),
    ('0004', '包丁', 'キッチン用品', 2800, '3030', '足立製作所'),
    ('0005', '圧力鍋', 'キッチン用品', 5000, '3030', '足立製作所'),
    ('0006', 'フォーク', 'キッチン用品', NULL, '4040', '隅田化工'),
    ('0007', 'おろしがね', 'キッチン用品', 790, '4040', '隅田化工'),
    ('0008', 'ボールペン', '事務用品', NULL, '2020', '旭商会');

SELECT * FROM 商品仕入;

-- 挿入時異状

INSERT INTO 商品仕入 (業者ID,業者名) VALUES
    ('5050', '荒川電機');

INSERT INTO 商品仕入 (商品ID,商品名,商品分類,仕入単価) VALUES
    ('0005','圧力鍋','キッチン用品',6800);

-- 修正時異状

UPDATE 商品仕入 SET 業者名 = '帝国重工'
    WHERE 商品ID = '0004';
SELECT * FROM 商品仕入;

-- 情報無損失分解（第3正規形）

CREATE TABLE 商品3 (
    商品ID CHAR(4) NOT NULL,
    商品名 VARCHAR(100) NOT NULL,
    商品分類 VARCHAR(32) NOT NULL,
    仕入単価 INTEGER,
    業者ID CHAR(4) NOT NULL,
    PRIMARY KEY (商品ID));

INSERT INTO 商品3 (商品ID,商品名,商品分類,仕入単価,業者ID) VALUES
    ('0001', 'Tシャツ', '衣服', 500, '1010'),
    ('0002', '穴あけパンチ', '事務用品', 320, '2020'),
    ('0003', 'カッターシャツ', '衣服', 2800, '1010'),
    ('0004', '包丁', 'キッチン用品', 2800, '3030'),
    ('0005', '圧力鍋', 'キッチン用品', 5000, '3030'),
    ('0006', 'フォーク', 'キッチン用品', NULL, '4040'),
    ('0007', 'おろしがね', 'キッチン用品', 790, '4040'),
    ('0008', 'ボールペン', '事務用品', NULL, '2020');

SELECT * FROM 商品3;

CREATE TABLE 仕入3 (
    業者ID CHAR(4) NOT NULL,
    業者名 VARCHAR(100) NOT NULL,
    PRIMARY KEY (業者ID));

INSERT INTO 仕入3 (業者ID,業者名) VALUES
    ('1010', '千住工業'),
    ('2020', '旭商会'),
    ('3030', '足立製作所'),
    ('4040', '隅田化工');

SELECT * FROM 仕入3;

SELECT 商品ID,商品名,商品分類,仕入単価,商品3.業者ID,業者名
    FROM 商品3 JOIN 仕入3 ON 商品3.業者ID = 仕入3.業者ID;

