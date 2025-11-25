CREATE SCHEMA TransactionsDB;

USE TransactionsDB;

CREATE TABLE Employees(
    Employee_id INT PRIMARY KEY,
    Manager_id INT,
    Name VARCHAR(100),
    Age INT,
    Salary INT
);

INSERT INTO Employees(Employee_id, Manager_id, Name, Age, Salary)
VALUES(101, 1, 'Arun', 45, 95000),
      (102, 2, 'Meena', 34, 65000),
      (103, 2, 'Suresh', 29, 55000),
      (104, 2, 'Kavitha', 26, 48000),
      (105, 3, 'Ramesh', 31, 52000);
      
      
SELECT * FROM Employees WHERE Employee_id = 105;

SET autocommit = 0;
START TRANSACTION;
UPDATE Employees
SET Manager_id = 3
WHERE Employee_id = 105;
COMMIT;

CREATE TABLE Bank_account (
    Account_id INT,
    Account_number VARCHAR(20),
    Balance INT
);

INSERT INTO Bank_account (Account_id, Account_number, Balance)
VALUES(1, 'ACC1001', 5000),
      (2, 'ACC1002', 12000),
      (3, 'ACC1003', 750);
      
SELECT * FROM Bank_account WHERE Account_number IN ('ACC1001', 'ACC1002');

UPDATE Bank_account SET Balance = Balance - 2000 WHERE Account_number = 'ACC1002';
UPDATE Bank_account SET Balance = Balance + 2000 WHERE Account_number = 'ACC1001';