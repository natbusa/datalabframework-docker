# Docker images

This is the repo where we keep the specialized images for the datalabframework demos.  
Currently, two images are here:

**pyspark-notebook**
This image is an rewrite of jupyter docker image pyspark notebook,  
which consists of a separate install of hadoop and pyspark, and extra jars to support minio.io

**datalabframework**
This image adds the datalabframework from source using conda pip.
