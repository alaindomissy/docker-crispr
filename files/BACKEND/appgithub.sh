#!/bin/bash

export APPSESS=/data/input/AppSession.json

pip uninstall -y pycrispr
pip install -q git+git://github.com/alaindomissy/pycrispr.git

app