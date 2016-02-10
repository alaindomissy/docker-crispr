#!/bin/bash

export APPSESS=/data/input/AppSession.json

pip uninstall -y pycrispr
pip install git+git://github.com/alaindomissy/pycrispr.git

app