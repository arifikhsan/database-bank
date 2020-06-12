-- Transaksi Budi
-- UPDATE inventories SET stock = 10 WHERE name = 'mangga'
-- SELECT * FROM inventories

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION
DECLARE @stock INT

SELECT @stock = stock
FROM inventories WHERE name = 'mangga'

-- Transaksi butuh waktu 10 detik
WAITFOR DELAY '00:00:10'
SET @stock = @stock - 5

UPDATE inventories 
SET stock = @stock
WHERE name = 'mangga'

PRINT @stock
COMMIT TRANSACTION

SELECT * FROM inventories



-- Transaksi Tono

-- SET TRANSACTION ISOLATION LEVEL SNAPSHOT
-- SET TRANSACTION ISOLATION LEVEL READ COMMITTED

SET TRANSACTION ISOLATION LEVEL REPEATABLE READ

BEGIN TRANSACTION
DECLARE @stock INT

SELECT @stock = stock
FROM inventories WHERE name = 'mangga'

-- Transaksi butuh waktu 1 detik
WAITFOR DELAY '00:00:01'
SET @stock = @stock - 4

UPDATE inventories 
SET stock = @stock
WHERE name = 'mangga'

PRINT @stock
COMMIT TRANSACTION

SELECT * FROM inventories

