#!/bin/sh

echo 'Backing up python softwares'
PYTHON=../data/python
pip freeze > ${PYTHON}/requirement.txt
pip2 freeze > ${PYTHON}/requirement2.txt
pip3 freeze > ${PYTHON}/requirement3.txt

