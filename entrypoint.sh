#!/bin/sh

# Run the state unemployment script
python laus-fetchers/stateUnemployment.py
echo "State unemployment data fetched."

# Run the county unemployment script
python laus-fetchers/countyUnemployment.py
echo "County unemployment data fetched."

# Run the place unemployment script
python laus-fetchers/placeUnemployment.py
echo "Place unemployment data fetched."

# Run the merger script
python laus-fetchers/merger.py
echo "Unemployment Data Ready."
