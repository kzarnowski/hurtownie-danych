/****** Script for SelectTopNRows command from SSMS  ******/
use project_prod
delete from FactSalesUpdate
delete from FactSales
delete from DIMCustomer
delete from DIMCarrier

use project_staging
delete from Carrier
delete from CarrierUpdate
delete from Customer
delete from CustomerUpdate
delete from Sales
delete from SalesUpdate