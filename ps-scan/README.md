# WTF
Basic Scanner for powershell gallery packages, it will download all the package and nupkg dependencies and run a regex for key words of potentially dangerous functions and save them into packagename-version.txt
The packages are zipped up into a file called packagename-version.zip

# HTF
```
chmod +x ./install.sh
./scan.sh name version
```

if you want to modify the regexes used, edit regexes.txt 
