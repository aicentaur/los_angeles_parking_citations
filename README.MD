# Los Angeles Parking 

The purpose of this project is an attempt to answer "What makes a parking meter dangerous to park at in Los Angeles?".
<br>
With growing number of vehicles on the road, city development and shortage of parking space in the city, Department of Transportation has quite complex parking policies and its enforcement. Parking tickets (also referred to as citations) cost about $160 million per year for car owners.
<br>
In this analysis, we are going to look closely at different metrics of parking violation and build machine learning model.
<br>
To support our assumption and analysis, we are using parking citations dataset for the last four years and parking meters inventory data provided by [City of Los Angeles](https://data.lacity.org/).

## Requirements

This application requires Python 3.6.8 to run and access to a MySQL instance 5.6 or greater.

## Prerequisites

Latitude and longitude in parking citations dataset are given in accordance with [ESRI:102645 NAD 1983 StatePlane California V FIPS 0405 Feet](https://epsg.io/102645) format. 
<br>
In order to use those coordinates for our map visualization, we would need to transform geospatial coordinates from one coordinate reference system to another. 
<br>
Python offers [PROJ](https://proj.org/index.html) library for performing conversions between cartographic projections.
<br>
1,401,193 (approximately 15% of total) parking tickets have latitude and longitude with 9.999900e+04 values.
<br>
Conversion of those values gives us location in the Pacific Ocean, thus we cannot use them for our visualization.
<br>
We have drop those parking tickets for the conversion of coordinates and save them in a separate csv file.

## Installation



## Running the Application

Now you should be able to launch the Flask application:

```bash
FLASK_APP=app.py flask run
```

Or simply:

```bash
python app.py
```

## Deployment

This application and its repository is organized for Heroku deployment.

To make a deployment, first add in your changes, test them, and merge them into the `master` branch.  Once merged into `master`, you can trigger the deployment to the `heroku` service:

```bash
git push heroku master
``` 

See also: https://github.com/yefim/flask-heroku-sample

Make sure you set up your app's configuration variables in the Heroku dashboard!  These will be read as environment variables.

