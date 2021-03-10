# Earthquake-Data-Analysis

## Description
The catalog includes the magnitude, time of occurrence (s), and 3D coordinates (m) of earthquakes in about 20 years of recording in South California. 
Coordinates were converted from latitude, longitude, and depth of events in a seismic catalog. Magnitudes should be within the range [0,8].

Waiting time (t): time interval between an event and the next one in the sequence.
Distance (r): Eucledian 3D distance between events. (each 3D set of coordinates refers to the hypocenter, i.e. the point triggering the slip in a fault that forms the earthquake)

## Dataset
- column 1: index of the event
- column 2: index of the previous event that triggered it (defined with a given algorithm), -1 if no ancestor is found
- column 3: time (seconds) from 0:00 of Jan.1st, 1982
- column 4: magnitude
- columns 5, 6, and 7: 3D coordinates (meters) of the earthquake hypocenter, i.e. of the point from where it started. 
These Euclidean coordinates are derived from latitude, longitude and depth.
