# docker-r-script
This repository shows how to use renv and Docker to reproducibly run a simple R script with command line arguments.

## Instructions

```
docker build -t docker-r-script .
docker run --rm docker-r-script --message 'hello world, again!' --number 1000
```
## Description
This script performs two actions:
1. Prints the user-specified message to the console
2. Randomly samples the number of user specified rows, fills a data frame, and computes the average of the first column, which is also printed to the console.  

The script uses the r-base image version 4.0.5, as specified at the top of the Dockerfile.  The required packages are restored from a saved renv.lock file.  