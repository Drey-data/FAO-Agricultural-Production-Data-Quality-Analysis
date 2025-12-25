/* ============================================================
   File: 02_data_quality_checks.sql
   Purpose:
   - Create row-level data quality flags on FAO unpivoted data
   - Identify missing values, zeros, and numeric validity
   - Support data completeness and quality analysis in Power BI

   Notes:
   - Quantity is treated as text because the source FAO data
     contains inconsistent representations of missing values
     (e.g. empty strings instead of NULL).
   - This logic intentionally avoids casting Quantity to numeric
     to preserve the original data behavior used in reporting.

   Output:
   - View: FAO_DataQuality_RowLevel

   Dependency:
   - FAO_Unpivoted (created in 01_unpivot_fao_data.sql)
   ============================================================ */

CREATE OR ALTER VIEW FAO_DataQuality_RowLevel AS
SELECT
    CountryAbbreviation,
    CountryCode,
    Country,
    ItemCode,
    Item,
    ElementCode,
    Element,
    Unit,
    Longitude,
    Latitude,
    Year,
    Quantity,

    -- 1. Missing Quantity detection
    -- Empty strings are treated as missing values
    CASE 
        WHEN LTRIM(RTRIM(Quantity)) = '' THEN 1
        ELSE 0
    END AS MissingFlag,

    -- 2. Zero detection
    -- Zero is kept separate from missing values
    CASE 
        WHEN Quantity = '0' THEN 1
        ELSE 0
    END AS ZeroFlag,

    -- 3. Numeric validity check
    -- Used to identify non-numeric text values
    CASE 
        WHEN ISNUMERIC(Quantity) = 1 THEN 1
        ELSE 0
    END AS NumericFlag

FROM
    FAO_Unpivoted;

GO

-- End of 02_data_quality_checks.sql
-- This view is consumed directly by Power BI for data quality metrics
