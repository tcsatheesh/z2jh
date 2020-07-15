FROM jupyter/minimal-notebook:latest

LABEL maintainer="GitHub User"

USER root

# patch to add secondary group
# COPY ogid/start.sh.patch /tmp/start.sh.patch
# RUN patch -u /usr/local/bin/start.sh -i /tmp/start.sh.patch

# required to active the modules in a non-interactive environment
# https://lmod.readthedocs.io/en/latest/030_installing.html#bash
COPY lmod/load_modules.sh /usr/local/bin

# Timezone info required for tzdata package https://stackoverflow.com/questions/44331836/apt-get-install-tzdata-noninteractive
RUN ln -fs /usr/share/zoneinfo/Europe/London /etc/localtime && \
    apt-get update && \
    apt-get --quiet --yes install \
        lua-filesystem \
        lua-json \
        lua-posix \
        lua-term \
        lua5.2 \
        tcl \
        tcl-dev \
        lmod && \
    conda update -n base conda && \
    chmod +x /usr/local/bin/load_modules.sh && \
    conda install --quiet --yes \
        pylint \
        yapf \
        ipywidgets \
        bqplot \
        nodejs \
        ipyleaflet \
        matplotlib \
        pandas \
        numpy \
        networkx \
        pythreejs && \
    jupyter labextension install \
        @jupyter-widgets/jupyterlab-manager \
        jupyter-leaflet \
        bqplot \
        jupyter-threejs && \
    mkdir /usr/local/share/jupyter && \
    fix-permissions /usr/local/share/jupyter


USER $NB_UID

COPY environment.yaml /tmp/environment.yaml
RUN conda env create -f /tmp/environment.yaml && \
    source activate azureml && \
    python -m ipykernel install --display-name "Azure Machine Learning" --name azureml

# https://lmod.readthedocs.io/en/latest/030_installing.html#bash-shell-scripts
ENV BASH_ENV /usr/local/bin/load_modules.sh

# Set the environment variable for LMOD
ENV LMOD_PKG /usr/share/lmod/lmod

USER $NB_UID
