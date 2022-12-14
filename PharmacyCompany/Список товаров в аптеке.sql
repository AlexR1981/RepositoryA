DECLARE @APharmacyID INT
SET @APharmacyID = 5
	
SELECT Pharmacy.Name Pharmacy, ProductName.Name Product,  SUM(productcount) PCount
FROM ProductName
LEFT JOIN batch
ON batch.ProductNameID = ProductName.id and productname.del = 0 
LEFT JOIN Warehouse 
ON batch.WarehouseID = Warehouse.id and Warehouse.del = 0
LEFT JOIN Pharmacy
ON Warehouse.PharmacyID = Pharmacy.id and pharmacy.del = 0 
WHERE
	pharmacy.id = @APharmacyID 	
GROUP BY ProductName.Name,Pharmacy.Name