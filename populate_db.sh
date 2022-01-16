#!/bin/bash

echo '>>> Installing virtualenv ...'

pip3 install virtualenv

echo '>>> Creating virtualenv ...'

virtualenv -p python3 venv

echo '>>> Activating virtualenv ...'

source venv/bin/activate

echo '>>> Installing packages ...'

pip3 install -r requirements.txt

echo '>>> Loading items ...'

python3 load_dynamo_items.py

echo '>>> Deacting virtualenv'

deactivate

rm -rf venv

rm -rf out.json