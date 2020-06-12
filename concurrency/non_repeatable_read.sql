-- Transaksi Budi

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION
SELECT stock FROM inventories WHERE name = 'mangga'

-- Proses
WAITFOR DELAY '00:00:5'

SELECT stock FROM inventories WHERE name = 'mangga'

COMMIT TRANSACTION

-- Transaksi Tono

BEGIN TRANSACTION
UPDATE inventories SET stock = 5 WHERE name = 'mangga'
SELECT * FROM inventories
COMMIT TRANSACTION
