#!/bin/bash

export APPSESS=/data/dev/pycrispr/tests/data/AppSession.json

#pip uninstall -y basespaceapp
pip install -e /data/dev/basespaceapp/

#pip uninstall -y pycrispr
pip install -e /data/dev/pycrispr/

app