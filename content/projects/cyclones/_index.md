---
date: "2018-09-09T00:00:00Z"
draft: false
lastmod: "2018-09-09T00:00:00Z"
linktitle: Soil Moisture
menu:
  cyclones:
    name: Soil Moisture and Extreme Precipitation
    weight: 1
summary: Impacts on Groundwater and Public Health
title: Soil Moisture
toc: true
type: docs
weight: 1
---

## Soil Moisture and Groundwater Vulnerability

Soil moisture is an important indicator of the state of the hydrologic cycle. Typically, soil moisture is thought of as an important indicator for how well vegetation is doing such as in major agriculturl areas. For example, it doesn't matter how much it rained yesterday if the soil could not retain any of it. Whereas precipitation tells informs us of how much water is falling to the ground, soil moisture informs us how much water is available for uptake by vegetation. Related to this is the landscapes capacity to absorb water. 

![](/img/dissertation/soilTexture.png)

Soil texture is one of the major drivers in a landscapes ability to handle water. It is not just percent sand / percent clay/ percent silt however, it is more complex than that. What is the slope of the land? Is it in a valley? How much sun does it get? Has the land been developed? How high is the water table? ... These are just a few questions that compound the difficulty of fully understanding how soil moisture changes through time and therefore how different landscapes respond to water received from extreme precipitation or other inputs such as overland flow caused by flooding (maybe extreme precipitation happened upstream). Luckily for us, we have access to an abundance of data that can be used to try to establish some of these relationships which may help us predict how different landscapes respond to extreme precipitation. If we can do this, we can then use this information to estimate areas that may be particularly vulnerable to groundwater contamination.

## Soil Moisture Data

Soil moisture data is available from a variety of sources and it ranges in both spatial and temporal resolution. Many other scientists throughout the United States are monitoring soil moisture for a variety of applications and have set up monitoring stations to log soil moisture through time. The [National Soil Moisture Network](http://nationalsoilmoisture.com/) aims to make as much of this data publicly available as possible. Temporally, much of this data is robust, for example, [North Carolina EcoNet](https://climate.ncsu.edu/econet) has 42 stations throughout North Carolina, some of which have been collecting data for decades. While these stations have recorded an abundance of data through time, they lack spatial resolution as they only record 42 points over the entire state. Airborne soil moisture data can be obtained using radar technology. Special sensors with either active radar (sends a signal which bounces of the earths surface then measures what comes back) or passive radiometer (only measures microwave radiation emitting from the surface) can and have been mounted to both airplanes and satellites. The [Uninhabited Aerial Vehicle Synthetic Aperture Radar (UAVSAR)](https://uavsar.jpl.nasa.gov/) is mounted onto a plane owned by NASA and used for a range of scientific experiments, including data collection following major hurricanes. While valuable, the limitation of this data is both spatial and temporal coverage. Although it gives us valuable high resolution snapshots, because it requires a flight crew and is restricted to one aircraft, data collection is rare and only exists for targetted events.

Cue The [Soil Moisture Active Passive (SMAP)](https://smap.jpl.nasa.gov/)satellite. This satellite, launched by NASA in 2015 was created for the sole purpose of investigating soil moisture, globally and continuously. SMAP had two sensors mounted onto it to detect soil moisture; one was an active radar sensor and the other is a passive radiometer. I say was and is due to the fact that the active radar instrument failed roughly 3 months after the launch of SMAP. As of this writing it is still unclear why the instrument failed. However the radiometer is still in operation and NASA has succesfully been working with the European Space Agency (ESA) in assimilating data from the Sentinal 1 satellites to pick up some of the slack in being able to create the original data products planned by NASA.

## SMAP Products
The NASA Distributed Archive Center at the National Snow and Ice Data Center processes and distributes a wide range of products derived from the SMAP satellite. [You can dig into all of them here](https://nsidc.org/data/smap/smap-data.html), however, the two we will be focused on are the SMAP/Sentinel-1L2 Radiometer/Radar 3km product and the SMAP L4 Global 3-hourly 9 km EASE-Grid Surface and Root Zone Soil Moisture Analysis