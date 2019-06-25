-- Create and use airports_by_country_db
CREATE DATABASE IF NOT EXISTS la_parking_db;
USE la_parking_db;

DROP TABLE IF EXISTS meters_inventory;


-- Create Meters Inventory Table
CREATE TABLE `meters_inventory` (
    id int(11) unsigned NOT NULL AUTO_INCREMENT,
    address VARCHAR(150),
    latitude DOUBLE(13,9) NOT NULL DEFAULT '0.000000000',
    longitude DOUBLE(13,9) NOT NULL DEFAULT '0.000000000',
    meter_type VARCHAR(80),
    parking_policy VARCHAR(255),
    policy_complexity VARCHAR(10),
    rate_range VARCHAR(20),
    rate_type VARCHAR(20),
    meter_id VARCHAR(20),
    street_cleaning VARCHAR(50),
    park_limit DOUBLE(4,2),
    PRIMARY KEY (id)
)ENGINE=InnoDB DEFAULT CHARSET=utf8;
