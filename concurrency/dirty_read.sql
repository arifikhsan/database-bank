-- Transaksi Budi

BEGIN TRANSACTION

UPDATE inventories set stock = stock - 1 where name = 'mangga'

-- Pembayaran untuk Budi
WAITFOR DElAY '00:00:10'
-- Uangnya kurang sehingga transaksi di rollback

ROLLBACK TRANSACTION

-- Transaksi Tono
SET TRANSACTION ISOLATION LEVEL READ UNCOMMITTED
Select * from inventories where name = 'mangga'
