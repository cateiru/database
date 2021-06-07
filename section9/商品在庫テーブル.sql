-- 商品在庫テーブル作成

CREATE TABLE 商品在庫 (
    商品ID CHAR(4) NOT NULL,
    商品名 VARCHAR(100) NOT NULL,
    商品分類 VARCHAR(32) NOT NULL,
    販売単価 INTEGER,
    店舗名 VARCHAR(200),
    数量 INTEGER,
    PRIMARY KEY (商品ID, 店舗名));

INSERT INTO 商品在庫 (商品ID,商品名,商品分類,販売単価,店舗名,数量) VALUES
    ('0001','Tシャツ','衣服',1000,'東京',30),
    ('0001','Tシャツ','衣服',1000,'福岡',100),
    ('0002','穴あけパンチ','事務用品',500,'名古屋',30),
    ('0002','穴あけパンチ','事務用品',500,'東京',50),
    ('0003','カッターシャツ','衣服',4000,'名古屋',120),
    ('0003','カッターシャツ','衣服',4000,'大阪',20),
    ('0004','包丁','キッチン用品',3000,'大阪',50);

SELECT * FROM 商品在庫;

-- 挿入時異状

INSERT INTO 商品在庫 (商品ID,商品名,商品分類,販売単価) VALUES
    ('0005','圧力鍋','キッチン用品',6800);

-- 削除時異状

DELETE FROM 商品在庫 WHERE 店舗名 = '大阪';
SELECT * FROM 商品在庫;

-- 修正時異状

UPDATE 商品在庫 SET 販売単価 = 1100
    WHERE 店舗名 = '東京' AND 商品ID = '0001';
SELECT * FROM 商品在庫;

-- リレーションの分解例

CREATE TABLE 商品1 (
    商品ID CHAR(4) NOT NULL,
    商品名 VARCHAR(100) NOT NULL,
    商品分類 VARCHAR(32) NOT NULL,
    販売単価 INTEGER,
    店舗名 VARCHAR(200),
    PRIMARY KEY (商品ID, 店舗名));

INSERT INTO 商品1 (商品ID,商品名,商品分類,販売単価,店舗名) VALUES
    ('0001','Tシャツ','衣服',1000,'東京'),
    ('0001','Tシャツ','衣服',1000,'福岡'),
    ('0002','穴あけパンチ','事務用品',500,'名古屋'),
    ('0002','穴あけパンチ','事務用品',500,'東京'),
    ('0003','カッターシャツ','衣服',4000,'名古屋'),
    ('0003','カッターシャツ','衣服',4000,'大阪'),
    ('0004','包丁','キッチン用品',3000,'大阪');

SELECT * FROM 商品1;

CREATE TABLE 在庫1 (
    店舗名 VARCHAR(200),
    数量 INTEGER,
    PRIMARY KEY (店舗名));

INSERT INTO 在庫1 (店舗名,数量) VALUES
    ('東京',30),
    ('福岡',100),
    ('名古屋',30),
    ('大阪',20);

SELECT * FROM 在庫1;

SELECT 商品ID,商品名,商品分類,販売単価,S.店舗名,数量
  FROM 商品1 AS S JOIN 在庫1 AS Z ON S.店舗名 = Z.店舗名;

-- 第2正規形への変換

CREATE TABLE 商品2 (
    商品ID CHAR(4) NOT NULL,
    商品名 VARCHAR(100) NOT NULL,
    商品分類 VARCHAR(32) NOT NULL,
    販売単価 INTEGER,
    PRIMARY KEY (商品ID));

INSERT INTO 商品2 (商品ID,商品名,商品分類,販売単価) VALUES
    ('0001','Tシャツ','衣服',1000),
    ('0002','穴あけパンチ','事務用品',500),
    ('0003','カッターシャツ','衣服',4000),
    ('0004','包丁','キッチン用品',3000);

SELECT * FROM 商品2;

CREATE TABLE 在庫2 (
    商品ID CHAR(4) NOT NULL,
    店舗名 VARCHAR(200),
    数量 INTEGER,
    PRIMARY KEY (商品ID, 店舗名));

INSERT INTO 在庫2 (商品ID,店舗名,数量) VALUES
    ('0001','東京',30),
    ('0001','福岡',100),
    ('0002','名古屋',30),
    ('0002','東京',50),
    ('0003','名古屋',120),
    ('0003','大阪',20),
    ('0004','大阪',50);

SELECT * FROM 在庫2;

-- 無損失分解の確認

SELECT S.商品ID,商品名,商品分類,販売単価,店舗名,数量
  FROM 商品2 AS S JOIN 在庫2 AS Z ON S.商品ID = Z.商品ID;

-- 挿入時異状なし

INSERT INTO 商品2 (商品ID,商品名,商品分類,販売単価) VALUES
    ('0005','圧力鍋','キッチン用品',6800);

-- 削除時異状なし

DELETE FROM 在庫2 WHERE 店舗名 = '大阪';

-- 修正時異状なし

UPDATE 商品2 SET 販売単価 = 1100
    WHERE 商品ID = '0001';

-- 更新結果

SELECT S.商品ID,商品名,商品分類,販売単価,店舗名,数量
  FROM 商品2 AS S LEFT JOIN 在庫2 AS Z ON S.商品ID = Z.商品ID;
