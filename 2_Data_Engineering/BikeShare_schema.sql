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


