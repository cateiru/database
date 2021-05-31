-- 部門テーブル

CREATE TABLE 部門 (
    部門番号 CHAR(3) NOT NULL,
    部門名 VARCHAR(20) NOT NULL,
    部屋番号 INT,
    PRIMARY KEY (部門番号)
);

INSERT INTO 部門 VALUES
    ('K01','人事部',401),
    ('K02','営業部',301),
    ('K03','広報部',201);

SELECT * FROM 部門;

-- 社員テーブル

CREATE TABLE 社員 (
    社員番号 CHAR(4) NOT NULL,
    氏名 VARCHAR(20) NOT NULL,
    年齢 INT,
    所属 CHAR(3),
    役職 VARCHAR(20),
    PRIMARY KEY (社員番号),
    FOREIGN KEY (所属) REFERENCES 部門(部門番号)
);

INSERT INTO 社員 VALUES
    ('E001','一橋市郎',51,'K02',NULL),
    ('E002','二宮次郎',49,'K02','部長'),
    ('E003','三島充希',49,'K03','部長'),
    ('E004','四谷史郎',40,'K01','部長'),
    ('E005','五味剛太',38,'K02',NULL),
    ('E006','六郷睦美',30,'K03',NULL),
    ('E007','七尾菜々',29,'K01',NULL),
    ('E008','八坂弥助',23,NULL,NULL),
    ('E009','九鬼久美',22,NULL,NULL);

SELECT * FROM 社員;

-- 主キー制約違反

INSERT INTO 社員 VALUES
    ('E003','三田美香',57,NULL,NULL);

UPDATE 社員
    SET 社員番号 = 'E009'
    WHERE 社員番号 = 'E008';

UPDATE 社員
    SET 社員番号 = NULL
    WHERE 社員番号 = 'E009';

-- 外部キー制約違反

INSERT INTO 社員 VALUES
    ('E010','十朱当麻',57,'K04',NULL);

UPDATE 社員
    SET 所属 = 'K05'
    WHERE 社員番号 = 'E008';

DELETE FROM 部門
    WHERE 部門番号 = 'K01';
