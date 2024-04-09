-- Use our database
USE ShopDB; 

-- Some data should be created outside the transaction (here)

-- Start the transaction 
START TRANSACTION; 

-- And some data should be created inside the transaction 
INSERT INTO Orders (CustomerID, Date) VALUES (1, '2023-01-01');

SET @orderID = LAST_INSERT_ID();

INSERT INTO OrderItems (OrderID, ProductID, Count) VALUES (@orderID, 1, 1);

UPDATE Products SET WarehouseAmount = WarehouseAmount - 1 WHERE ID = 1;

SELECT WarehouseAmount FROM Products;

ROLLBACK;

SELECT WarehouseAmount FROM Products;

COMMIT;
