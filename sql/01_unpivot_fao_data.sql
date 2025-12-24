/* ================================
FAO Agricultural Production Data
UNPIVOT Transformation Script

Purpose:

Convert wide yearly columns (1961–2013) into a long-format table

Enable time-series and trend analysis

Serve as the base table for data quality checks and Power BI reporting


Source:

Raw FAO agricultural production CSV


Output:

FAO_Unpivoted table (Year, Quantity)


Author: Dare Olopade
================================= /
CREATE OR ALTER VIEW FAO_Unpivoted
AS
SELECT
FAO_Raw.CountryAbbreviation,FAO_Raw.CountryCode,FAO_Raw.Country,FAO_Raw.ItemCode,FAO_Raw.Item,FAO_Raw.ElementCode,FAO_Raw.Element,FAO_Raw.Unit,FAO_Raw.Latitude,
FAO_Raw.Longitude,
x.Year,
x.Quantity
FROM FAO_Raw
CROSS APPLY (
VALUES
('1961', FAO_Raw.[1961]),('1962', FAO_Raw.[1962]),('1963', FAO_Raw.[1963]),('1964', FAO_Raw.[1964]),('1965', FAO_Raw.[1965]),('1966', FAO_Raw.[1966]),
('1967', FAO_Raw.[1967]),('1968', FAO_Raw.[1968]),('1969', FAO_Raw.[1969]),('1970', FAO_Raw.[1970]),('1971', FAO_Raw.[1971]),('1972', FAO_Raw.[1972]),
('1973', FAO_Raw.[1973]),('1974', FAO_Raw.[1974]),('1975', FAO_Raw.[1975]),('1976', FAO_Raw.[1976]),('1977', FAO_Raw.[1977]),('1978', FAO_Raw.[1978]),
('1979', FAO_Raw.[1979]),('1980', FAO_Raw.[1980]),('1981', FAO_Raw.[1981]),('1982', FAO_Raw.[1982]),('1983', FAO_Raw.[1983]),('1984', FAO_Raw.[1984]),
('1985', FAO_Raw.[1985]),('1986', FAO_Raw.[1986]),('1987', FAO_Raw.[1987]),('1988', FAO_Raw.[1988]),('1989', FAO_Raw.[1989]),('1990', FAO_Raw.[1990]),
('1991', FAO_Raw.[1991]),('1992', FAO_Raw.[1992]),('1993', FAO_Raw.[1993]),('1994', FAO_Raw.[1994]),('1995', FAO_Raw.[1995]),('1996', FAO_Raw.[1996]),
('1997', FAO_Raw.[1997]),('1998', FAO_Raw.[1998]),('1999', FAO_Raw.[1999]),('2000', FAO_Raw.[2000]),('2001', FAO_Raw.[2001]),('2002', FAO_Raw.[2002]),
('2003', FAO_Raw.[2003]),('2004', FAO_Raw.[2004]),('2005', FAO_Raw.[2005]),('2006', FAO_Raw.[2006]),('2007', FAO_Raw.[2007]),('2008', FAO_Raw.[2008]),
('2009', FAO_Raw.[2009]),('2010', FAO_Raw.[2010]),('2011', FAO_Raw.[2011]),('2012', FAO_Raw.[2012]),('2013', FAO_Raw.[2013])
) AS x(Year, Quantity);
GO
/ =================================
Notes:

Years outside 1961–2013 were excluded

Quantity values may contain zeros or NULLs

Data quality flags were applied in a separate view
(FAO_DataQuality_RowLevel)


This script represents the final cleaned version
used for analysis and dashboarding.
================================= */
