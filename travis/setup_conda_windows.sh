#!/bin/bash
# This script assumes we are running under git-bash (MinGW) on Windows

if [[ $DEBUG == True ]]; then
    set -x
fi

if [[ -z "${MINICONDA_VERSION}" ]]; then
    MINICONDA_VERSION=4.5.4
fi

wget https://repo.continuum.io/miniconda/Miniconda3-${MINICONDA_VERSION}-Windows-x86_64.exe -O miniconda.exe

ls
miniconda.exe /InstallationType=JustMe /RegisterPython=0 /S /D=$HOME\miniconda
export PATH="$HOME/miniconda/scripts:$HOME/miniconda/:$PATH";

PIN_FILE_CONDA="$HOME/miniconda3/conda-meta/pinned"
PIN_FILE="$HOME/miniconda/envs/test/conda-meta/pinned"

# Install common Python dependencies
echo "setting up common dependencies"
source "$( dirname "${BASH_SOURCE[0]}" )"/setup_dependencies_common.sh
