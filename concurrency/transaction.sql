-- Transfer $100 from Mark to Mary Account

BEGIN TRY
    BEGIN TRANSACTION
         UPDATE Accounts SET Balance = Balance - 100 WHERE Id = 1
         UPDATE Accounts SET Balance = Balance + 100 WHERE Id = 2
    COMMIT TRANSACTION
    PRINT 'Transaction Committed'
END TRY
BEGIN CATCH
    ROLLBACK TRANSACTION
    PRINT 'Transaction Rolled back'
END CATCH
