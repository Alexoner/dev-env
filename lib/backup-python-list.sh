#!/bin/sh

echo 'Backing up python softwares'
PYTHON=python
pip freeze > ${PYTHON}/requirement.txt
pip2 freeze > ${PYTHON}/requirement.txt
pip3 freeze > ${PYTHON}/requirement.txt

