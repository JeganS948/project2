# Project ETL

## Bike Share

### Data Sources
1. **Trip Data**  
  * ***Toronto*** https://open.toronto.ca/dataset/bike-share-toronto-ridership-data/  
  * ***Vancouver*** https://www.mobibikes.ca/en/system-data  
  * ***Boston*** https://www.bluebikes.com/system-data  
  * ***New York*** https://www.citibikenyc.com/system-data  

2. **Stations**  
  * [Toronto](https://toronto-us.publicbikesystem.net/ube/gbfs/v1/en/station_information)
  * [Vancouver](https://vancouver-gbfs.smoove.pro/gbfs/en/station_information.json)
  * [Boston](https://gbfs.bluebikes.com/gbfs/en/station_information.json)
  * [New York](https://gbfs.citibikenyc.com/gbfs/en/station_information.json)
       

3. **Historical Weather**
  * API calls to https://www.worldweatheronline.com/developer/api/historical-weather-api.aspx

### Transformation needed
  * cleaning: drop columns not needed, drop rows with invalid data
  * add column
  * map added column to another table
  * joining data from multiple sources
  * filtering table to get unique values
  * splitting columns into two columns
  * validating data from referential tables
  * creating tables available data

### Type of final database - relational