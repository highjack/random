#!/bin/bash

if [ "$#" -ne 2 ]; then
        echo "./scan <package-name> <version>"
        exit
fi

rm *.zip 2>/dev/null
rm *.txt 2>/dev/null
mkdir ./packages 2>/dev/null
docker run -ti -v $(pwd)/packages:/packages -e PACKAGE=$1 -e VERSION=$2  powershell
mkdir ./nupkg 2>/dev/null
find . -wholename "./packages/*.nupkg" -exec cp {} ./nupkg/ \;
python3 ps-scan.py $1 $2
rm -r ./packages
rm -r ./nupkg
