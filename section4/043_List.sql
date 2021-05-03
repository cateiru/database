-- 第4章　データの更新

-- List4-15　登録日をすべて「2009年10月10日」に変更

UPDATE 商品Copy
   SET 登録日 = '2009-10-10';

-- 変更内容の確認
SELECT * FROM 商品Copy ORDER BY 商品ID;

-- List4-16　商品分類が「キッチン用品」の行のみ販売単価を10倍に変更

UPDATE 商品Copy
   SET 販売単価 = 販売単価 * 10
 WHERE 商品分類 = 'キッチン用品';

-- 変更内容の確認
SELECT * FROM 商品Copy ORDER BY 商品ID;

-- List4-17　商品IDが「0008」のボールペンの登録日をNULLに変更

UPDATE 商品Copy
   SET 登録日 = NULL
 WHERE 商品ID = '0008';

--変更内容の確認
SELECT * FROM 商品Copy ORDER BY 商品ID;

-- List4-18　正しく更新できるが冗長なUPDATE文

UPDATE 商品Copy
   SET 販売単価 = 販売単価 * 10
 WHERE 商品分類 = 'キッチン用品';

UPDATE 商品Copy
   SET 仕入単価 = 仕入単価 / 2
 WHERE 商品分類 = 'キッチン用品';

-- List4-19　List4-18の処理を1つのUPDATE文にまとめる方法(1)

-- 列をカンマ区切りで並べる
UPDATE 商品Copy
   SET 販売単価 = 販売単価 * 10,
       仕入単価 = 仕入単価 / 2
 WHERE 商品分類 = 'キッチン用品';

-- 変更内容の確認
SELECT * FROM 商品Copy ORDER BY 商品ID;

-- List4-20　List4-18の処理を1つのUPDATE文にまとめる方法(2)

-- 列をカッコ()で囲むことによるリスト表現
UPDATE 商品Copy
   SET (販売単価, 仕入単価) = (販売単価 * 10, 仕入単価 / 2)
 WHERE 商品分類 = 'キッチン用品';

-- 変更内容の確認
SELECT * FROM 商品Copy ORDER BY 商品ID;
