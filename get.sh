#!/usr/bin/env bash

## 2020 WGS84 30arcsec shapefile
SHAPE="https://ghsl.jrc.ec.europa.eu/download/GHSL_data_4326_shapefile.zip"
OUTDIR="data/tiles-WGS84-30arcsec-shape"

## mellweide proj
## https://ghsl.jrc.ec.europa.eu/download/GHSL_data_54009_shapefile.zip"

FILE=`BASENAME "$SHAPE"`

## retrieve the shape file data
mkdir -p $OUTDIR/raw || { echo "failed creating $OUTDIR/raw"; exit 1; } 2>&1

if [ ! -e $OUTDIR/raw/$FILE ]; then
    curl "$SHAPE" > $OUTDIR/raw/$FILE
    cd $OUTDIR
    unzip -x raw/$FILE
else
    echo "$FILE already exists"
fi
