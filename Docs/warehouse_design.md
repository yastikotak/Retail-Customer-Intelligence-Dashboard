\# Retail Customer Churn Intelligence Data Warehouse



\## Architecture



Raw Dataset

↓



Staging Layer



↓



Fact Table



↓



Dimension Tables



↓



Power BI



\---



\## Staging Table



stg\_online\_retail



Purpose



Stores cleaned transaction data imported from CSV.



\---



\## Fact Table



fact\_sales



Grain



One row = One product purchased in one invoice.



Measures



Quantity



UnitPrice



Revenue



Flags



IsCancelled



IsReturn



\---



\## Dimension Tables



dim\_customer



dim\_product



dim\_country



dim\_date

