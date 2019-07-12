# Parking Meter Revenue Prediction from Parking Citations 
*IN PROGRESS*


<br>
The purpose of this model is an attempt to predict how much revenue each parking meter can generate from parking citations in Los Angeles.
<br>

## Table of Contents
1. [Introduction](#intro)
2. [Data Collection](#dcollection)
3. [Data Munging](#dmunging)
4. [ML Model](#ml)
5. [Analysis / Visualization](#av)

<a name="intro"></a>
## 1. Introduction

<p>With growing number of vehicles on the road, city development and shortage of parking spaces in the city, Department of Transportation has quite complex parking policies and its enforcement. Parking tickets (also referred to as citations) cost about $160 million per year for car owners.</p>

<p>In this analysis, we are going to look closely at different metrics of parking violation, determine main drivers and build machine learning model.</p>



<a name="dcollection"></a>
## 2. Data Collection

<p>For this model we used two data sets provided by City of Los Angeles:</p>

1. [Parking Citations](https://data.lacity.org/A-Well-Run-City/Parking-Citations/wjz9-h9np)
2. [Parking Meter Inventory](https://data.lacity.org/A-Livable-and-Sustainable-City/Parking-Meter-Inventory/s49e-q6j2)

<p>Both datasets were accessed via The Socrata Open Data API (SODA) API</p>

<p>For this project, data extraction process was automated.</p>

To start your own raw data exploration, clone this repository on your comupter and run `python extract_citations.py` (for parking citations dataset) and `python extract_inventory.py` (for meters inventory dataset) in your terminal window from appropriate folder. It would take about 30-50 minutes to have all json files locally.



<a name="dmunging"></a>
## 3. Data Munging

<p>Data cleaning and transformation was performed in Jupyter Notebooks.</p>

*Parking Citations* responses contain about 9.5 million records and take about 4 GB of storage space.
<br>
*Meters Inventory* responses contain about 35,000 records and take about 16 MB of storage space.</p>

<p>Due to the large amount of records, data had to be processed in chunks. In this particular example, 2 million records was a comfortable number for the Jupyter Notebook to process without any performance/kernel issues.</p>
<p>Standardized data transformation approach was applied for each data chunk:</p>

1. Load records into dataframe.
2. Determine % of missing data.
3. Drop redundant columns/rows.
4. Transform "issue_date" column to date format.
5. Save data with missing Latitude / Longitude values into a separate csv file.
6. Transform Latitude / Longitude coordinates to Leaflet readable format.
7. Save data chunk into a csv file.

<p>This transormational approach yields 5 csv files (about 1 GB) ready to use for the analysis and visualizations.</p>

*Parking Citations* data munging code can be accessed [here.](https://github.com/aicentaur/los_angeles_parking_citations/blob/master/data_collection_munging/parking_citations/transform_citations.ipynb)
<br>
*Meters Inventory* data munging code can be accessed [here.](https://github.com/aicentaur/los_angeles_parking_citations/blob/master/data_collection_munging/meters_inventory/transform_inventory.ipynb)

<p>The next step is to create a new dataset for our machine learning model by extracting/groupping data from both parking citations and meters inventory datasets.</p>

The code for this step can be found [here.](https://github.com/aicentaur/los_angeles_parking_citations/blob/master/ml_model/ml_model_data_preparation.ipynb)
<br>

> **IMPORTANT** <br>
> Latitude and longitude in parking citations dataset are given in accordance with <br>[ESRI:102645 NAD 1983 StatePlane California V FIPS 0405 Feet](https://epsg.io/102645) format.
<br> In order to use those coordinates for our map visualization, we would need to transform geospatial coordinates from one coordinate reference system to another. <br>
Python offers [PROJ](https://proj.org/index.html) library for performing conversions between cartographic projections.
> <p>1,401,193 (approximately 15% of total) parking tickets have latitude and longitude with 9.999900e+04 values.<br>
> Conversion of those values gives us location in the Pacific Ocean, thus we cannot use them for our visualization.<br>
> We have drop those parking tickets for the conversion of coordinates step and save them in a separate csv file.</p>


<a name="ml"></a>
## 4. ML Model



<a name="av"></a>
## 5. Analysis / Visualization


