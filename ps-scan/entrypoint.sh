#!/bin/bash
echo Downloading $PACKAGE $VERSION
mono /usr/bin/nuget.exe install $PACKAGE -Version $VERSION -OutputDirectory /packages -Source https://www.powershellgallery.com/api/v2/
chmod 777 -R /packages
