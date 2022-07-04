# Amazon-Forest-Dataset
R-Code related to raster-based dataset of covariates related to Forest1 Fire Analysis for the region of Amazon Rainforest

- File 'helper_functions.R' contains functions for each variable used in their respective processing in R
- Each variable has a separate code (file)
- Code is generally similar for all
- Code is availble for all cases (e.g. if only one file is to be processed or a batch processing of 20 years is required)

* Code is designed to process for all years and for the each respective month as follows:
  (1) Crop the raster based on provided Amazon basin boundary shapefile
  (2) Save the cropped raster as 'Pre-Processed data'
  (3) Call the respective function for that variable
  (4) Save the Spatial Grid developed as output of that applied function
     
* Function is generally designed to process as follows:
  (c) Create an empty Spatial grid of 500m cell size, with the data extent of Amazon basin boundary
  (b) Disaggregate the input raster of variable data to approximately 500m cell size
  (c) Transfer the values of the data from Disaggregated raster file to empty Spatial Grid
  
