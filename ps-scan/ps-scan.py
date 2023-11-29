import argparse
import os
import requests
import subprocess
import zipfile
import re
import shutil

def create_zip(folder_path, zip_filename):
    print("zipping packages to {}".format(zip_filename))
    with zipfile.ZipFile(zip_filename, 'w', zipfile.ZIP_DEFLATED) as zipf:
        for root, _, files in os.walk(folder_path):
            for file in files:
                file_path = os.path.join(root, file)
                arcname = os.path.relpath(file_path, folder_path)
                zipf.write(file_path, arcname)

def run_grep(src_folder, regex_file, report_file):
    print("Grepping for potentially dangerous functionality, report will be written to {}, please wait...".format(report_file))
    os.system("grep -iEHnr --include='*.ps1' --include='*.psm1' -f ./regexes ./packages >> " + report_file)

if __name__ == "__main__":
    parser = argparse.ArgumentParser(description="Download and explore a package from PowerShell Gallery.")
    parser.add_argument("package_name", help="Name of the package")
    parser.add_argument("package_version", help="Version of the package")
    args = parser.parse_args()
    
    pkg_folder = "./packages"
    
    report_name = args.package_name + "-" + args.package_version + ".txt"
    
    if os.path.exists(report_name):
        os.remove(report_name)
    zip_name = report_name.replace(".txt",".zip")
    create_zip("./nupkg","./"+zip_name)
    run_grep(pkg_folder, "regexes",report_name)
