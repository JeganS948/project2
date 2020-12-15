/*
-- drop database if exists
DROP DATABASE IF EXISTS "BikeShareDB";

-- create database
CREATE DATABASE "BikeShareDB"
    WITH 
    OWNER = postgres
    ENCODING = 'UTF8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = -1;
*/

-- drop table if exists
DROP table IF EXISTS Locations CASCADE;
DROP table IF EXISTS MemberTypes CASCADE;
DROP table IF EXISTS Pricing CASCADE;
DROP table IF EXISTS Stations CASCADE;
DROP table IF EXISTS Bikes CASCADE;
DROP table IF EXISTS Ridership CASCADE;

-- create table Locations
CREATE table Locations (
    location_id int not null,
    city varchar(100) not null,
    country varchar(100) not null,
    PRIMARY KEY (location_id)
);

-- create table MemberTypes
CREATE table MemberTypes (
    member_type varchar(50) not null,
    location_id int not null,
    PRIMARY KEY (member_type, location_id),
    CONSTRAINT fk_membertypes_locations
        FOREIGN KEY (location_id)
        REFERENCES Locations (location_id)
);

-- create table Pricing
CREATE table Pricing (
    price_id int not null,
    location_id int not null,
    member_type varchar(50) not null,
    plan varchar(50) not null,
    amount numeric(10,2) not null,
    PRIMARY KEY (price_id),
    CONSTRAINT fk_pricing_membertypes
        FOREIGN KEY (member_type, location_id)
        REFERENCES MemberTypes (member_type, location_id)
);

-- create table stations
CREATE table Stations (
    station_id int not null,
    station_name varchar(255) not null,
    latitude numeric(11,8) not null,
    longitude numeric(11,8) not null,
    location_id int not null,
    PRIMARY KEY (station_id, location_id),
    CONSTRAINT fk_stations_locations
        FOREIGN KEY (location_id)
        REFERENCES Locations (location_id)
);

-- create table Bikes
CREATE table Bikes (
    bike_id int not null,
    location_id int not null,
    PRIMARY KEY (bike_id, location_id),
    CONSTRAINT fk_bikes_locations
        FOREIGN KEY (location_id)
        REFERENCES Locations (location_id)
);

-- create table Ridership
CREATE table Ridership (
    id int not null,
    trip_duration int not null,
    start_station_id int not null,
    end_station_id int not null,
    start_date timestamp not null,
    end_date timestamp not null,
    bike_id int not null,
    location_id int not null,
    member_type varchar(50) not null,
    PRIMARY KEY (id),
    CONSTRAINT fk_rides_bikes
        FOREIGN KEY (bike_id, location_id)
        REFERENCES Bikes (bike_id, location_id),
    CONSTRAINT fk_rides_membertype
        FOREIGN KEY (member_type, location_id)
        REFERENCES MemberTypes (member_type, location_id),
    CONSTRAINT fk_rides_stations_start
        FOREIGN KEY (start_station_id, location_id)
        REFERENCES Stations (station_id, location_id),
    CONSTRAINT fk_rides_stations_end
        FOREIGN KEY (end_station_id, location_id)
        REFERENCES Stations (station_id, location_id)
);
