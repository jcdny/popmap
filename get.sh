#!/usr/bin/env bash

## 2020 WGS84 30arcsec shapefile
SHAPE="https://ghsl.jrc.ec.europa.eu/download/GHSL_data_4326_shapefile.zip"

## mellweide proj
## https://ghsl.jrc.ec.europa.eu/download/GHSL_data_54009_shapefile.zip"

FILE=`BASENAME "$SHAPE"`

## retrieve the shape file data
mkdir -p shapefile/raw
if [ ! -e shapefile/raw/$FILE ]; then 
    curl "$SHAPE" > shapefile/raw/$FILE
    cd shapefile
    unzip -x raw/$FILE
else
    echo "$FILE already exists"
fi
