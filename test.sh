#!/bin/env bash


fails=""

inspect() {
	if [ $1 -ne 0 ]; then
		fails="${fails} $2"
	fi
}

source ./env/bin/activate
python -m pytest -v
inspect $? test

# return proper code
if [ -n "${fails}" ]; then
	echo "Tests failed: ${fails}"
	exit 1
else
	echo "Tests passed!"
	exit 0
fi
