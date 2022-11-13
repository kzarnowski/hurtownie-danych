CREATE CLUSTERED INDEX idx_customer_state ON [dbo].[DIMCustomers] ([state])

IF EXISTS
(
  SELECT 1 FROM sys.indexes
  WHERE name='idx_customer_state' AND object_id = OBJECT_ID('[dbo].[DIMCustomers]')
)
BEGIN
     PRINT 'Clustered index "idx_customer_state" exists'
END