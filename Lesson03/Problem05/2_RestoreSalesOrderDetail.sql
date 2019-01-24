USE AdventureWorks
GO
SET IDENTITY_INSERT Sales.SalesOrderDetail ON;  
GO
INSERT INTO [Sales].[SalesOrderDetail]
           (SalesOrderID
		   ,[SalesOrderDetailID]
			,[CarrierTrackingNumber]
           ,[OrderQty]
           ,[ProductID]
           ,[SpecialOfferID]
           ,[UnitPrice]
           ,[UnitPriceDiscount]
           ,[rowguid]
           ,[ModifiedDate])
    select
			SalesOrderID 
			,[SalesOrderDetailID]
           ,[CarrierTrackingNumber]
           ,[OrderQty]
           ,[ProductID]
           ,[SpecialOfferID]
           ,[UnitPrice]
           ,[UnitPriceDiscount]
           ,[rowguid]
           ,[ModifiedDate]
		   from salesorderdetail as s
		   where s.SalesOrderdetailID not in (select d.SalesOrderDetailID from sales.salesorderdetail d)
GO
SET IDENTITY_INSERT Sales.SalesOrderDetail OFF;