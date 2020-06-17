USE bank
GO

DROP TABLE table_a
DROP TABLE table_b

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
    ('tabel A baris 1')
INSERT INTO table_a
VALUES
    ('tabel A baris 2')
INSERT INTO table_a
VALUES
    ('tabel A baris 3')
INSERT INTO table_a
VALUES
    ('tabel A baris 4')
INSERT INTO table_a
VALUES
    ('tabel A baris 5')

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
UPDATE table_a SET name = name + ' transaksi A' 
WHERE id IN (1, 2, 3, 4, 5)

-- langkah 3
UPDATE table_b SET name = name + 'transaksi A' 
WHERE id = 1

COMMIT TRANSACTION

-- Transaksi B

SET DEADLOCK_PRIORITY HIGH
GO

BEGIN TRANSACTION
-- langkah 2
UPDATE table_b SET name = name + ' transaksi B' 
WHERE id = 1

-- langkah 4
UPDATE table_a SET name = name + ' transaksi B' 
WHERE id IN (1, 2, 3, 4, 5)

COMMIT TRANSACTION
