
## Function to load packages
load_packages <- function(){
  library(raster)
  library(mapview)
  library(rgdal)
  library(tictoc)
  library(terra)
  library(tmap)
}

## Function to get Empty Spatial Grid based on Amazon Vector Extent 
get_empty_grid <- function(ref_vect){
  m_temp <- matrix()
  grid = terra::rast(m_temp)
  terra::ext(grid) = terra::ext(ref_vect)
  terra::crs(grid) = terra::crs(ref_vect)
  terra::res(grid) <- 500
  return(grid)
} 

## Function for LULC TIF to Spatial Grid
lulc_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rast_disagg <- terra::disagg(crpd_rast, fact=c(11,11))
  
  spat_grid_val <- terra::resample(rast_disagg, spat_grid, method='near')
  
  return(spat_grid_val)
}

## Function for Burnt Area Classified TIF to Spatial Grid
fire_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rclmat <- matrix((c(-2, 0, 0, 1, 366, 1)), ncol=3, byrow=TRUE)
  crpd_rast_clss <- terra::classify(crpd_rast, rclmat, include.lowest=TRUE)
  
  spat_grid_val <- terra::resample(crpd_rast_clss, spat_grid, method='near')
  
  return(spat_grid_val)
}

## Function for Surface Temperature TIF to Spatial Grid
surftemp_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rast_disagg <- terra::disagg(crpd_rast, fact=c(11,11))
  
  spat_grid_val <- terra::resample(rast_disagg, spat_grid, method='bilinear')
  
  return(spat_grid_val)
}


## Function for Precipitation TIF to Spatial Grid
prec_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rast_disagg <- terra::disagg(crpd_rast, fact=c(22,22))
  
  spat_grid_val <- terra::resample(rast_disagg, spat_grid, method='bilinear')
  
  return(spat_grid_val)
}


## Function for Soil Moisture TIF to Spatial Grid
soilm_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rast_disagg <- terra::disagg(crpd_rast, fact=c(57,57))
  
  spat_grid_val <- terra::resample(rast_disagg, spat_grid, method='bilinear')
  
  return(spat_grid_val)
}

## Function for Soil Moisture TIF to Spatial Grid
soilm_2_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rast_disagg <- terra::disagg(crpd_rast, fact=c(74,74))
  
  spat_grid_val <- terra::resample(rast_disagg, spat_grid, method='near')
  
  return(spat_grid_val)
}

## Function for Humidity TIF to Spatial Grid
humidity_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rast_disagg <- terra::disagg(crpd_rast, fact=c(23,23))
  
  spat_grid_val <- terra::resample(rast_disagg, spat_grid, method='near')
  
  return(spat_grid_val)
}

## Function for Evapotranspiration TIF to Spatial Grid
evapotranspiration_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rast_disagg <- terra::disagg(crpd_rast, fact=c(23,23))
  
  spat_grid_val <- terra::resample(rast_disagg, spat_grid, method='near')
  
  return(spat_grid_val)
}

## Function for Wind TIF to Spatial Grid
wind_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rast_disagg <- terra::disagg(crpd_rast, fact=c(23,23))
  
  spat_grid_val <- terra::resample(rast_disagg, spat_grid, method='near')
  
  return(spat_grid_val)
}

## Function for Air Temperature TIF to Spatial Grid
airtemp_to_spat_grid <- function(crpd_rast, vect_for_spat_grid){
  
  spat_grid <- get_empty_grid(vect_for_spat_grid)
  
  rast_disagg <- terra::disagg(crpd_rast, fact=c(23,23))
  
  spat_grid_val <- terra::resample(rast_disagg, spat_grid, method='near')
  
  return(spat_grid_val)
}





















