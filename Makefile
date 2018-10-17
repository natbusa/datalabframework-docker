SHELL=/bin/bash

USERNAME ?= $(USER)

DLF_VERSION = v0.5.9
NOTEBOOK_VERSION = spark2.3.2-hadoop2.8.5

all: login pyspark-notebook datalabframework

login:
	docker login

datalabframework:	images/datalabframework/Dockerfile
	$(eval IMAGENAME = $@)
	docker build -t $(USERNAME)/$(IMAGENAME):$(DLF_VERSION) \
	       --build-arg USERNAME=$(USERNAME) \
				 --build-arg DLF_VERSION=$(DLF_VERSION) -f $^ $(shell dirname $^)
	docker push $(USERNAME)/$(IMAGENAME):$(DLF_VERSION)

pyspark-notebook:	images/pyspark-notebook/Dockerfile
	$(eval IMAGENAME = $@)
	docker build -t $(USERNAME)/$(IMAGENAME):$(NOTEBOOK_VERSION) -f $^ $(shell dirname $^)
	docker push $(USERNAME)/$(IMAGENAME):$(NOTEBOOK_VERSION)

.PHONY: all pyspark-notebook datalabframework login
.DEFAULT_GOAL := all
