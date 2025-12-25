/* ============================================================
   FAO Country-to-Continent Mapping
   ============================================================

   Purpose:
   - Attach continent information to FAO analytical tables
   - Enable regional analysis in Power BI
   - Avoid duplicating continent logic inside Power BI

   Notes:
   - Mapping is done using country name matching
   - TRIM functions are used to handle spacing inconsistencies
   - This script reflects the final working logic used in the project

   ============================================================ */

CREATE OR ALTER VIEW FAO_DataQuality_RowLevel AS
SELECT
    FAO_Unpivoted.CountryAbbreviation,
    FAO_Unpivoted.CountryCode,
    FAO_Unpivoted.Country,
    FAO_Unpivoted.ItemCode,
    FAO_Unpivoted.Item,
    FAO_Unpivoted.ElementCode,
    FAO_Unpivoted.Element,
    FAO_Unpivoted.Unit,
    FAO_Unpivoted.Longitude,
    FAO_Unpivoted.Latitude,
    FAO_Unpivoted.Year,
    FAO_Unpivoted.Quantity,
    FAO_Unpivoted.MissingFlag,
    FAO_Unpivoted.ZeroFlag,
    FAO_Unpivoted.NumericFlag,
    country_continent_mapping.Continent
FROM FAO_Unpivoted
LEFT JOIN country_continent_mapping
    ON LTRIM(RTRIM(FAO_Unpivoted.Country)) =
       LTRIM(RTRIM(country_continent_mapping.Country));
GO
