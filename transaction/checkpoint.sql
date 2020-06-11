START TRANSACTION;

UPDATE `accounts`
SET `balance` = `balance` - 100
WHERE `name` = 'budi';

SAVEPOINT reduce_balance;

UPDATE `accounts`
SET `balance` = `balance` + 50
WHERE `name` = 'tono';

ROLLBACK TO SAVEPOINT reduce_balance;

UPDATE `accounts`
SET `balance` = `balance` + 100
WHERE `name` = 'tono';

COMMIT;