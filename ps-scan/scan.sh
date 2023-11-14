#!/bin/bash

if [ "$#" -ne 2 ]; then
	echo "./scan <package-name> <version>"
	exit
fi

mkdir ./packages 2>/dev/null
docker run -ti -v $(pwd)/packages:/packages -e PACKAGE=$1 -e VERSION=$2  powershell
python3 ps-scan.py $1 $2
