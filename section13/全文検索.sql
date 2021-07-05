-- PostgreSQL 全文検索機能

CREATE TABLE documents (
    id INTEGER PRIMARY KEY,
	message TEXT
);

INSERT INTO documents VALUES
    (1, 'A fat cat eats a fat rat on a mat.'),
	(2, 'A fat rat eats a small cat on a mat.'),
	(3, 'Fat cats eat fat rats in the small house.'),
	(4, 'A fat cat finds a white dog in the garden.');

SELECT * FROM documents;

-- LIKE述語による検索
SELECT * FROM documents
    WHERE message LIKE '%cat%' AND message LIKE '%rat%';

-- @@演算子による検索（言語無指定）
SELECT * FROM documents
    WHERE to_tsvector(message) @@ to_tsquery('cat & rat');

-- @@演算子による検索（英語指定）
SELECT * FROM documents
    WHERE to_tsvector('english', message) @@ to_tsquery('english', 'cat & rat');

SELECT * FROM documents
    WHERE to_tsvector('english', message) @@ to_tsquery('english', 'cat | rat');

-- to_tsvector と to_tsquery の機能
SELECT to_tsvector('english', 'A fat cat eats a fat rat on a mat.');

SELECT to_tsquery('english', 'cats & eats');

-- 語句解析
SELECT phraseto_tsquery('english', 'A fat a cat eats fat rat on a mat.');

SELECT * FROM ts_debug('english', 'A fat a cat eats fat rat on a mat.');

SELECT * FROM ts_stat(
    'SELECT to_tsvector(''english'', message) FROM documents');

-- 語順を考慮した検索
SELECT * FROM documents
    WHERE to_tsvector('english', message) @@ to_tsquery('english', 'cat <-> eat');

-- 検索結果のスコアリング
SELECT *,
    ts_rank(to_tsvector('english', message),
			to_tsquery('english', 'fat | rat | house')) AS score
    FROM documents
	ORDER BY score DESC;
