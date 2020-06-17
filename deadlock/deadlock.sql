USE bank
GO

CREATE TABLE table_a
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    name NVARCHAR(50) NOT NULL
)
GO

CREATE TABLE table_b
(
    Id INT IDENTITY NOT NULL PRIMARY KEY,
    name NVARCHAR(50) NOT NULL
)
GO

INSERT INTO table_a
VALUES
    ('isi tabel A')
GO
INSERT INTO table_b
VALUES
    ('isi tabel B')
GO

SELECT *
FROM table_a
SELECT *
FROM table_b

TRUNCATE TABLE table_a;
TRUNCATE TABLE table_b;

-- Transaksi A

BEGIN TRANSACTION
-- langkah 1
UPDATE table_a SET name = 'transaksi A' 
WHERE id = 1

-- langkah 3
UPDATE table_b SET name = 'transaksi A' 
WHERE id = 1

COMMIT TRANSACTION

-- Transaksi B

BEGIN TRANSACTION
-- langkah 2
UPDATE table_b SET name = 'transaksi B' 
WHERE id = 1

-- langkah 4
UPDATE table_a SET name = 'transaksi B' 
WHERE id = 1

COMMIT TRANSACTION
