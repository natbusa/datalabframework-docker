ARG USERNAME
FROM ${USERNAME}/pyspark-notebook

USER $NB_UID

ARG DLF_VERSION
RUN pip install git+https://github.com/natbusa/datalabframework@${DLF_VERSION}

# Ready to go: switch to user $NB_USER
USER $NB_USER
