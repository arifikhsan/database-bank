START TRANSACTION;
UPDATE `accounts`
SET `balance` = `balance` - 100
WHERE `name` = 'budi';
UPDATE `accounts`
SET `balance` = `balance` + 100
WHERE `name` = 'tono';
COMMIT;