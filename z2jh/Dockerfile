ARG BASE_CONTAINER=jupyter/minimal-notebook:54462805efcb
FROM $BASE_CONTAINER

LABEL maintainer="Mea Culpa"

USER root

# patch to add secondary group
COPY start.sh.patch /tmp/start.sh.patch
RUN patch -u /usr/local/bin/start.sh -i /tmp/start.sh.patch

USER $NB_UID

# change the pinned version to 4.6.14
COPY pinned /opt/conda/conda-meta/pinned
RUN conda config --set auto_update_conda True && \
    conda install conda=4.6.14 && \
    conda config --set auto_update_conda False

RUN conda install jupyterlab=2.1.0

USER $NB_UID
