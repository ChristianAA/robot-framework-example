# Robot Framework example

This repository contains the base setup of an UI testing project, using Robot Framework + Selenium Library

A simple search in DuckDuckGo to check that results are displayed is used as example

# Requirements

* Python 3.12.X
* pip and setuptools
* [venv](<https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>) (recommended)
* Chrome and Firefox

# Instalation

Assuming python, pip and venv are installed correctly:

1. Download or clone this repository 
2. Open a terminal
3. Go to the project root directory "/selenium-python-example/".
4. Create a virtual environment: 
   - (UBUNTU): `python3 -m venv .venv`
   - (WINDOWS): `py -m venv venv`
5. Activate the virtual environment executing the following script: 
   - (UBUNTU): `source .venv/bin/activate`
   - (WINDOWS): `.\venv\Scripts\activate`
6. Execute the following command to download the necessary libraries:  `pip install -r requirements.txt`

# Test Execution

1. Open a terminal
2. From the project root directory run: `robot --pythonpath resources -d results tests/`

# Configuration

By default, tests will be executed in Chrome (headless mode). Preferences can be changed in "/config/defaults.yaml" file

# Results

To check the report, open the '/results/report.html' file once the execution has finished.

# Links
   
   [Robot Framework (Github)](<https://github.com/robotframework/robotframework>)
   
   [Robot Framework (Web)](<https://robotframework.org/>)
   
   [Selenium Library](<https://github.com/robotframework/SeleniumLibrary>)
   
   [Webdriver Manager for Python](<https://github.com/SergeyPirogov/webdriver_manager>)