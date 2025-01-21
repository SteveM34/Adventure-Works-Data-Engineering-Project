CREATE DATABASE SCOPED CREDENTIAL cred_steve
WITH IDENTITY = 'Managed Identity'
  

CREATE EXTERNAL DATA SOURCE source_silver
WITH 
(
    LOCATION = 'https://awstoragedatalakesteve.blob.core.windows.net/silver',
    CREDENTIAL = cred_steve
)

CREATE EXTERNAL DATA SOURCE source_gold
WITH 
(
    LOCATION = 'https://awstoragedatalakesteve.blob.core.windows.net/gold',
    CREDENTIAL = cred_steve
)

CREATE EXTERNAL FILE FORMAT format_parquet
WITH 
(
    FORMAT_TYPE = PARQUET,
    DATA_COMPRESSION = 'org.apache.hadoop.io.compress.SnappyCodec'
)


-----------------------------------
-- CREATE EXTERNAL TABLE EXTSALES
-----------------------------------

CREATE EXTERNAL TABLE gold.extsales
WITH
(
        LOCATION= 'extsales',
        DATA_SOURCE= source_gold,
        FILE_FORMAT = format_parquet
        
)
AS
SELECT * FROM gold.sales


SELECT * FROM gold.extsales



-----------------------------------
-- CREATE EXTERNAL TABLE EXTCAL
-----------------------------------
CREATE EXTERNAL TABLE gold.extcalendar
WITH
(
    LOCATION = 'extcalendar',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.calendar


SELECT * FROM gold.extcalendar

-----------------------------------
-- CREATE EXTERNAL TABLE EXTCUSTOMERS
-----------------------------------
CREATE EXTERNAL TABLE gold.extcustomers
WITH
(
    LOCATION = 'extcustomers',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.customers

SELECT * FROM gold.extcustomers


-----------------------------------
-- CREATE EXTERNAL TABLE EXTPRODUCTS
-----------------------------------
CREATE EXTERNAL TABLE gold.extproducts
WITH
(
    LOCATION = 'extproducts',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.products



-----------------------------------
-- CREATE EXTERNAL TABLE EXTRETURNS
-----------------------------------
CREATE EXTERNAL TABLE gold.extreturns
WITH
(
    LOCATION = 'extreturns',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.returns




-----------------------------------
-- CREATE EXTERNAL TABLE EXTSUBCAT
-----------------------------------
CREATE EXTERNAL TABLE gold.extsubcat
WITH
(
    LOCATION = 'extSubCategories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.subcat



-----------------------------------
-- CREATE EXTERNAL TABLE EXTTerritories
-----------------------------------
CREATE EXTERNAL TABLE gold.extterritories
WITH
(
    LOCATION = 'extTerritories',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.territories


-----------------------------------
-- CREATE EXTERNAL TABLE EXTProCat
-----------------------------------
CREATE EXTERNAL TABLE gold.extProCat
WITH
(
    LOCATION = 'extProCat',
    DATA_SOURCE = source_gold,
    FILE_FORMAT = format_parquet
)
AS
SELECT * FROM gold.procat