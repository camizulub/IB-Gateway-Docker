#!/bin/bash
#
# Script to Install
# Linux System Tools and
# Basic Python Components
#
#
# GENERAL LINUX
apt update  # updates the package index cache
apt upgrade -y  # updates packages
# install system tools
apt install -y screen vim  # system tools
apt install -y gcc git htop unzip # system tools
apt upgrade -y bash  # upgrades bash if necessary
apt clean  # cleans up the package index cache

# INSTALLING MINICONDA
wget https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh \
		-O Miniconda.sh
bash Miniconda.sh -b  # installs Miniconda
rm -rf Miniconda.sh  # removes the installer
# prepends the new path for current session
export PATH="/root/miniconda3/bin:$PATH"
# prepends the new path in the shell configuration
cat >> ~/.profile <<EOF
export PATH="/root/miniconda3/bin:$PATH"
EOF

# INSTALLING PYTHON LIBRARIES
conda init bash
conda install -y jupyter  # interactive data analytics in the browser
conda install -y jupyterlab  # Jupyter Lab environment
conda install -y pandas  #  data analysis package
conda install -y xlrd  #  excel files handler
conda install -y matplotlib  # standard plotting library
conda install -y seaborn  # statistical plotting library
conda install -y quandl  # wrapper for Quandl data API
conda install -y scikit-learn  # machine learning library
conda install -y pyyaml  # package to manage yaml files

pip install --upgrade pip  # upgrading the package manager
pip install q  # logging and debugging
pip install plotly  # interactive D3.js plots
pip install cufflinks  # combining plotly with pandas
pip install tensorflow  # deep learning library
pip install keras  # deep learning library
pip install eikon  # Python wrapper for the Refinitiv Eikon Data API
# Python wrapper for Oanda API
pip install git+git://github.com/yhilpisch/tpqoa
# Python database for time-series
pip install git+git://github.com/manahl/arctic
# Library for working with the Trader Workstation API
pip install ib_insync

# COPYING FILES AND CREATING DIRECTORIES
mkdir /root/.jupyter
mkdir /root/.jupyter/custom
wget http://hilpisch.com/custom.css
mv custom.css /root/.jupyter/custom
#mv /root/jupyter_notebook_config.py /root/.jupyter/
#mv /root/mycert.pem /root/.jupyter
#mv /root/mykey.key /root/.jupyter
mkdir /root/notebook
