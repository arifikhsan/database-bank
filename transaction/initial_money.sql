START TRANSACTION;
UPDATE `accounts`
SET `balance` = 500
WHERE `name` = 'budi';
UPDATE `accounts`
SET `balance` = 500
WHERE `name` = 'tono';
COMMIT;