-- insert into fruits values ('mangga')
-- select * from fruits where name like '%a%'
-- SELECT * FROM fruits
-- DELETE FROM fruits WHERE name = 'mangga'

-- Transaksi 1
SET TRANSACTION ISOLATION LEVEL SERIALIZABLE
BEGIN TRANSACTION

SELECT * FROM fruits WHERE name LIKE '%a%'

-- Melakukan suatu proses
WAITFOR DELAY '00:00:10'

SELECT * FROM fruits WHERE name LIKE '%a%'

COMMIT TRANSACTION

-- Transaksi 2

BEGIN TRANSACTION

INSERT INTO fruits VALUES ('mangga')
SELECT * FROM fruits

COMMIT TRANSACTION
