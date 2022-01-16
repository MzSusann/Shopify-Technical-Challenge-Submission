--a. How many orders were shipped by Speedy Express in total?

SELECT COUNT(*) FROM [Orders]
JOIN Shippers
ON Orders.ShipperID = Shippers.ShipperID
WHERE Orders.ShipperID = 1


ANS: 54

--b. What is the last name of the employee with the most orders?

SELECT Employees.LastName, COUNT(OrderID) as Freq FROM [Orders]
JOIN Employees
ON Orders.EmployeeID = Employees.EmployeeID
GROUP BY Employees.EmployeeID
ORDER BY Freq DESC
LIMIT 1

ANS: Peacock

-- c. What product was ordered the most by customers in Germany?
SELECT Products.ProductName, SUM(OrderDetails.Quantity) AS Products_Ordered FROM [Orders]
JOIN OrderDetails
ON Orders.OrderID = OrderDetails.OrderID
JOIN Products
ON OrderDetails.ProductID = Products.ProductID
JOIN Customers
ON Orders.CustomerID = Customers.CustomerID
WHERE Country = 'Germany' 
GROUP BY OrderDetails.ProductID, Products.ProductName
ORDER BY Products_Ordered DESC
LIMIT 1

ANS: Boston Crab Meat