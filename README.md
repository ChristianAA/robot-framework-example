# Robot Framework example

This repository contains the base setup of an UI testing project, using Robot Framework

A simple search in DuckDuckGo to check that results are displayed is used as example

# Requirements

* Python 3.7.X
* pip and setuptools
* [venv](<https://packaging.python.org/guides/installing-using-pip-and-virtual-environments/>) (recommended)

# Instalation

1. Download or clone the repository 
2. Open a terminal
3. Go to the project root directory "/robot-framework-examples/".
4. Create a virtual environment: `py -m venv venv`
5. Activate the virtual environment executing the following script: `.\venv\Scripts\activate`
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
   
   