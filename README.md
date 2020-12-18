# Project ETL
<img src="Images/bike.jpg">

## Bike Share
Bike-sharing is a form of transportations that has seen a significant increase in usage
globally. The current shift to usage of more sustainable transportation is a
trend that embraces the onset of reducing carbon emissions and allocated
capital investments from urban transport. The onset helps our economy benefits
our economy by encouraging methods in preventing global warming, which in turn
allows us to allocate the extra capital investment into other projects that can
further provide a stable infrastructure. Not only does this program provide
benefits to our economy but it also encourages our public to maintain a healthy
lifestyle

As the Ministry of Transportation, we want to understand the feasibility of implementing a bike-sharing program across Canada. In Canada, we chose two major cities, Toronto & Vancouver, that already have a prototype bike-sharing program implemented and are active in gathering insight on bike-sharing programs. We chose to compare the efficiency of this program from a country with a similar economy as Canada, the US economy.  The two cities, Boston, and New York will be used as a compar-ison sample against Toronto and Vancouver. 

## Extraction
<img src="Images/pd.read.png">

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
  
4. **Pricing**
   ***Toronto*** https://bikesharetoronto.com/pricing/
  * ***Vancouver*** https://www.mobibikes.ca/en/offers-subscription 
  * ***Boston*** https://www.bluebikes.com/pricing 
  * ***New York*** https://www.citibikenyc.com/pricing
  
  ### Data Modeling & Engineering
 * A database will be created a based on this Entity Relationship Diagram (ERD) that will look at six   main aspects: location, member type, pricing, station, bike, and ridership information. 
 
 <img src="Images/erd.png">

## Transform
 * We will use Jupyter Notebook to combine and clean our data. Steps include:
 
Trip Data

<img src="Images/trip.png">

   * drop columns not needed, drop rows with invalid data
   * add primary and composite key id's to tables
   * joining data from multiple sources
   * filtering table to get unique values
   * splitting columns with id information within
   * creating tables available data
   
Station Data
<img src="Images/pd.read.png">

   * Api calls to retrieve station and location data
   * for loop to parse through data for each urul
   
Weather Data:
<img src="Images/loop.png">

Pricing Data: 

### Type of final database - relational

### Load
Load data in this sequence:
1. Locations
2. HistoricalWeather
3. Stations
4. Pricing
5. Bikes
6. MemberTypes
7. Ridership - load only the records where start_station_id and end_station_id exists in Stations table

**Note:**
We have to cap our data due to space limitations on cloud server.


### Method
#### 1. Analysis
  * analyse data files
  * create entity relationship diagram based on data available
  * create a relational database 

#### 2. Process data files
#####  A. Extract
    1. find data
    2. extract data by file downloads, web scraping, API calls
    3. study files
    4. create dataframes
#####  B. Transform
    5. drop unnecessary columns
    6. drop bad records, i.e., nulls, invalid dates
    7. split columns to get necessary data
    8. rename columns
    9. rearrange columns in dataframe to follow database table structure
    10. add location identifier column
    11. save new dataframe to csv file
#####  C. Load
    12. Read csv files
    13. Load csv files into dataframes
    14. Check for integrity constraints
    15. Drop records with column values not in reference table
    16. Use sqlalchemy to load files into database