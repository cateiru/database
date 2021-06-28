-- 銀行口座テーブル

DROP TABLE IF EXISTS 銀行口座;
CREATE TABLE 銀行口座 (
    口座番号 INT NOT NULL,
    口座名義 VARCHAR(20) NOT NULL,
	預金残高 INT NOT NULL,
	PRIMARY KEY (口座番号)
);

INSERT INTO 銀行口座 VALUES
    (101010, '千住一郎', 9000),
    (151515, '住吉春香', 1000);

SELECT * FROM 銀行口座;


-- READ COMMITED 例1

-- Terminal A
BEGIN ISOLATION LEVEL READ COMMITTED;
CREATE TEMPORARY TABLE 一時保存 AS
    SELECT 預金残高 FROM 銀行口座 WHERE 口座番号 = 101010;
SELECT 預金残高 FROM 一時保存;

-- Terminal B
BEGIN ISOLATION LEVEL READ COMMITTED;
UPDATE 銀行口座 SET 預金残高 = 預金残高-300 WHERE 口座番号 = 101010;
COMMIT;
SELECT * FROM 銀行口座;

-- Terminal A
UPDATE 銀行口座 SET 預金残高 = 
    (SELECT 預金残高 FROM 一時保存)-500 WHERE 口座番号 = 101010;
DROP TABLE 一時保存;
COMMIT;
SELECT * FROM 銀行口座;  -- 遺失更新異状

-- READ COMMITED 例2

-- Terminal A
BEGIN ISOLATION LEVEL READ COMMITTED;
SELECT * FROM 銀行口座;

-- Terminal B
BEGIN ISOLATION LEVEL READ COMMITTED;
UPDATE 銀行口座 SET 預金残高 = 預金残高-300 WHERE 口座番号 = 101010;
COMMIT;
SELECT * FROM 銀行口座;

-- Terminal A
SELECT * FROM 銀行口座; -- 不整合検索異状
COMMIT;

-- 銀行口座テーブルのリセット

TRUNCATE 銀行口座;
INSERT INTO 銀行口座 VALUES
    (101010, '千住一郎', 9000),
    (151515, '住吉春香', 1000);

-- REPEATABLE READ 例1

-- Terminal A
BEGIN ISOLATION LEVEL SERIALIZABLE;
CREATE TEMPORARY TABLE 一時保存 AS
    SELECT 預金残高 FROM 銀行口座 WHERE 口座番号 = 101010 FOR UPDATE;
SELECT 預金残高 FROM 一時保存;

-- Terminal B
BEGIN ISOLATION LEVEL SERIALIZABLE;
UPDATE 銀行口座 SET 預金残高 = 預金残高-300 WHERE 口座番号 = 101010;
COMMIT;
SELECT * FROM 銀行口座;

-- Terminal A
UPDATE 銀行口座 SET 預金残高 = 
    (SELECT 預金残高 FROM 一時保存)-500 WHERE 口座番号 = 101010;
DROP TABLE 一時保存;
COMMIT;
SELECT * FROM 銀行口座;  -- 遺失更新異状なし

-- REPEATABLE READ 例2

-- Terminal A
BEGIN ISOLATION LEVEL SERIALIZABLE;
SELECT * FROM 銀行口座;

-- Terminal B
BEGIN ISOLATION LEVEL SERIALIZABLE;
UPDATE 銀行口座 SET 預金残高 = 預金残高-300 WHERE 口座番号 = 101010;
COMMIT;
SELECT * FROM 銀行口座;

-- Terminal A
SELECT * FROM 銀行口座; -- 不整合検索異状なし
COMMIT;

-- REPEATABLE READ 例3

-- Terminal A
BEGIN ISOLATION LEVEL SERIALIZABLE;
UPDATE 銀行口座 SET 預金残高 = 預金残高-500 WHERE 口座番号 = 101010;

-- Terminal B
BEGIN ISOLATION LEVEL SERIALIZABLE;
UPDATE 銀行口座 SET 預金残高 = 預金残高-300 WHERE 口座番号 = 151515;
UPDATE 銀行口座 SET 預金残高 = 預金残高-300 WHERE 口座番号 = 101010;

-- Terminal A
UPDATE 銀行口座 SET 預金残高 = 預金残高-500 WHERE 口座番号 = 151515; -- デッドロック
COMMIT;

-- Terminal B
COMMIT;
