-- 銀行口座テーブル

CREATE TABLE 銀行口座 (
    口座番号 INT NOT NULL,
    口座名義 VARCHAR(20) NOT NULL,
	預金残高 INT NOT NULL,
	PRIMARY KEY (口座番号)
);

INSERT INTO 銀行口座 VALUES
    (101010, '千住一郎', 9000),
    (151515, '住吉春香', 1000),
    (202020, '百田次郎', 8000),
    (252525, '田中夏代', 2000),
    (303030, '十朱三郎', 7000),
    (353535, '朱雀秋子', 3000),
    (404040, '一瀬司郎', 6000),
    (454545, '瀬川冬美', 4000);

SELECT * FROM 銀行口座;

-- 自動コミットモード
UPDATE 銀行口座 SET 預金残高 = 預金残高-500 WHERE 口座番号 = 101010;
UPDATE 銀行口座 SET 預金残高 = 預金残高+500 WHERE 口座番号 = 151515;
ROLLBACK;
SELECT * FROM 銀行口座;

-- 手動コミットモード
BEGIN TRANSACTION;
UPDATE 銀行口座 SET 預金残高 = 預金残高-400 WHERE 口座番号 = 202020;
UPDATE 銀行口座 SET 預金残高 = 預金残高+400 WHERE 口座番号 = 252525;
ROLLBACK;
SELECT * FROM 銀行口座;

-- チェックポイント処理
-- BEGIN TRANSACTION T1
UPDATE 銀行口座 SET 預金残高 = 預金残高-500 WHERE 口座番号 = 101010; -- T1
-- BEGIN TRANSACTION T2
UPDATE 銀行口座 SET 預金残高 = 預金残高-400 WHERE 口座番号 = 202020; -- T2
SELECT * FROM 銀行口座; -- 確認用
-- CHECKPOINT
UPDATE 銀行口座 SET 預金残高 = 預金残高+400 WHERE 口座番号 = 252525; -- T2
-- COMMIT T2
-- BEGIN TRANSACTION T3
UPDATE 銀行口座 SET 預金残高 = 預金残高-300 WHERE 口座番号 = 303030; -- T3
-- BEGIN TRNSACTION T4
UPDATE 銀行口座 SET 預金残高 = 預金残高-200 WHERE 口座番号 = 404040; -- T4
UPDATE 銀行口座 SET 預金残高 = 預金残高+300 WHERE 口座番号 = 353535; -- T3
-- COMMIT T3
SELECT * FROM 銀行口座; -- 確認用
-- SYSTEM CRASH
-- RESTORE
-- ROLLBACK T1
-- REDO T2
-- REDO T3

