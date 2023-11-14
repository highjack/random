#!/bin/bash
echo Downloading $PACKAGE $VERSION
pwsh -Command "& { Register-PSRepository -Default }"
pwsh -Command "& { Install-Module -Name PowerShellGet -RequiredVersion 2.2.5 -Force}"
pwsh -Command "& {Set-PSRepository -Name PSGallery -InstallationPolicy Trusted}"
pwsh -Command "& {Save-Module $PACKAGE -RequiredVersion $VERSION -Path /packages}"
