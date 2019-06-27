-- Create and use airports_by_country_db
CREATE DATABASE IF NOT EXISTS la_parking_db;
USE la_parking_db;

DROP TABLE IF EXISTS meters_inventory;
DROP TABLE IF EXISTS parking_citations;


-- Create Meters Inventory Table
CREATE TABLE `meters_inventory` (
    id int(11) unsigned NOT NULL AUTO_INCREMENT,
    address varchar(150) DEFAULT NULL,
    latitude double(13,9) NOT NULL DEFAULT '0.000000000',
    longitude double(13,9) NOT NULL DEFAULT '0.000000000',
    meter_type varchar(80) DEFAULT NULL,
    parking_policy varchar(255) DEFAULT NULL,
    policy_complexity varchar(10) DEFAULT NULL,
    rate_range varchar(20) DEFAULT NULL,
    rate_type varchar(20) DEFAULT NULL,
    meter_id varchar(20) DEFAULT NULL,
    street_cleaning varchar(50) DEFAULT NULL,
    park_limit double(4,2) DEFAULT NULL,
    PRIMARY KEY (id)
) ENGINE=InnoDB AUTO_INCREMENT=33990 DEFAULT CHARSET=utf8;



-- Create Parking Citations Table
CREATE TABLE `parking_citations` (
    id int(11) unsigned NOT NULL AUTO_INCREMENT,
    ticket_number int(11) unsigned NOT NULL,
    issue_date datetime NOT NULL,
    issue_time datetime NOT NULL,
    make varchar(8) NOT NULL DEFAULT '',
    body_style varchar(16) NOT NULL DEFAULT '',
    color varchar(8) NOT NULL DEFAULT '',
    location varchar(32) NOT NULL DEFAULT '',
    route varchar(32) NOT NULL DEFAULT '',
    agency varchar(32) NOT NULL DEFAULT '',
    violation_code varchar(32) NOT NULL DEFAULT '',
    violation_description varchar(64) NOT NULL DEFAULT '',
    fine_amount decimal(6,2) NOT NULL DEFAULT '0.00',
    latitude double(13,9) NOT NULL DEFAULT '0.000000000',
    longitude double(13,9) NOT NULL DEFAULT '0.000000000',
    PRIMARY KEY (id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;






-- Create Meters Inventory Table
-- CREATE TABLE `meters_inventory` (
--     id int(11) unsigned NOT NULL AUTO_INCREMENT,
--     address VARCHAR(150),
--     latitude DOUBLE(13,9) NOT NULL DEFAULT '0.000000000',
--     longitude DOUBLE(13,9) NOT NULL DEFAULT '0.000000000',
--     meter_type VARCHAR(80),
--     parking_policy VARCHAR(255),
--     policy_complexity VARCHAR(10),
--     rate_range VARCHAR(20),
--     rate_type VARCHAR(20),
--     meter_id VARCHAR(20),
--     street_cleaning VARCHAR(50),
--     park_limit DOUBLE(4,2),
--     PRIMARY KEY (id)
-- )ENGINE=InnoDB DEFAULT CHARSET=utf8;

