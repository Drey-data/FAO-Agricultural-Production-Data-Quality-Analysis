# FAO-Agricultural-Production-Data-Quality-Analysis
An end-to-end SQL and Power BI project analyzing FAO agricultural production data with a focus on data quality, completeness, and reporting trends.

# FAO Agricultural Production Data Quality & Analysis

## Project Overview
This project analyzes agricultural production data from the Food and Agriculture Organization (FAO) to assess data quality, uncover production trends, and improve analytical usability.

The dataset contains country-level agricultural production records across multiple years. Due to missing values, zero values, and inconsistent reporting across regions and time periods, direct analysis can be misleading without proper cleaning and validation.

This project focuses on transforming the raw FAO dataset into a clean, analysis-ready format and visualizing insights using Power BI.


## Objectives
- Clean and standardize FAO agricultural production data
- Distinguish between missing values and true zero production values
- Evaluate data completeness and reporting consistency over time
- Build interactive dashboards for production and data quality analysis


## Tools Used
- SQL (data transformation, unpivoting, data quality checks)
- Power BI (data modeling, visualization, dashboards)
- Excel / CSV (raw data storage)

## SQL Pipeline Overview

The SQL scripts in this project were executed in a logical pipeline to transform raw FAO agricultural data into an analytical, dashboard-ready format.

1. **01_unpivot_fao_data.sql**  
   Converts the raw FAO dataset from a wide yearly format into a long-format table (`FAO_Unpivoted`) to enable time-series analysis.

2. **02_data_quality_checks.sql**  
   Creates a row-level data quality view (`FAO_DataQuality_RowLevel`) with flags for missing values, zero values, and numeric validation.  
   This logic reflects the final, production-ready SQL used in the Power BI dashboard.

3. **03_continent_mapping.sql**  
   Enriches the dataset by mapping countries to continents for regional analysis and aggregation.
