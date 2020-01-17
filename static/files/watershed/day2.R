library(dataRetrieval)
library(sf)
library(raster)
library(here)
library(prism)
library(mapview)
library(plotly)

# USGS Gauge Data

siteNo <- "0208773375"     # The USGS site number
pCode <- "00060"           # The code for discharge
start.date <- "2014-01-01"
end.date <- "2014-12-31"

# Create a spatial point for the gauge
gauge <- data.frame(Name = "Swift Creek", lon = -78.498611, lat = 35.575 )   #
gauge_sf <- st_as_sf(gauge, coords = c('lon','lat'), crs = 4326)             #

# Download the data with the parameters you just set
swiftCreek <- readNWISuv(siteNumbers = siteNo,
                         parameterCd = pCode,
                         startDate = start.date,
                         endDate = end.date)%>%
  renameNWISColumns()

# Convert cubic feet per second to cubic meters per second in a new column.
swiftCreek$Flow_Inst_m <- swiftCreek$Flow_Inst * 0.0283168


# Make a simple hydrograph with base R
plot(swiftCreek$Flow_Inst_m~swiftCreek$dateTime)


# Download some precipitation data for the same year

options(prism.path = here("data"))   # Sets where the prism data will be downloaded

get_prism_annual('ppt',years = 2014, keepZip = FALSE)   # Downloads rainfall for 2014

ppt <- raster(here("data/PRISM_ppt_stable_4kmM3_2014_bil/PRISM_ppt_stable_4kmM3_2014_bil.bil"))  #Import the raster into R

# Let's take a look
plot(ppt)    # Tries to make a simple plot of the data

# Import the watershed boundary
wbd <- st_read(here("data/WBD.shp"))    #

# Crop the rainfall raster layer to the watershed
pptCrop <- crop(ppt,wbd)        #

# Make a map of the watershed with ppt
mapview(pptCrop)+          #
  mapview(wbd)+             #
  mapview(gauge_sf)         #

## Answer the following questions

# 1. (5 pts) What was the average rainfall in mm for this watershed in 2014?

swiftPpt <- as.data.frame(extract(pptCrop,wbd))   #

meanPpt <- mean(swiftPpt[,1],na.rm=TRUE)   #


# Answer:


# 2. (10 pts) What was the (averaged) total volume of water in m^3 that fell over this watershed in 2014?
# For this you just need to use the meanPpt variable you just created but you also need 
# to deterine the area of the watershed. Remember that the sf package has functions for geometries.
# try searching the sf package help page for 'area'

area <- 'FIND CORRECT FUNCTION'(wbd)                #
totPpt <- meanPpt*as.numeric(area) / 1000           #

# Answer:


# 3. (10 pts) What month did this watershed exhibit the greatest discharge?
# For this we can use a group function to calculate discharge by month
# using the 'dplyr' package from tidyverse

monthlyQ <- swiftCreek%>%                       #
  mutate(Month = substr(dateTime,6,7))%>%       #
  group_by(Month)%>%                            #
  mutate(Discharge = sum(Flow_Inst_m*60*15))%>%   #
  ungroup()%>%
  dplyr::select(Month, Discharge)%>%            #
  distinct()                                    #

monthlyQ%>%                                     #
  plot_ly(x=~Month, y=~Discharge)%>%            #
  add_bars()                                    #

# 4. (5 pts) What month did this watershed exhibit the least discharge?

# Answer:

# 5. (5 pts) What is the Water Balance for this watershed based on our numbers?

totQ <- sum(monthlyQ$Discharge)                 #

balance <- totPpt-totQ                          #

# Answer: 

# 6. (10 pts) Why are these numbers so different? provide three thoughts on potential reasons.

# Answer:

# 7. (7 pts) List the main purpose of each of the packages we used (a quick google should get you through this pretty quickly)

# dataRetrieval: 
# sf:
# raster:
# here:
# prism:
# mapview:
# plotly:
