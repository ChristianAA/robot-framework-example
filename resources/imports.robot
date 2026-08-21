*** Settings ***
Library        SeleniumLibrary
Library        libs/helpers.py
Variables      ../config/defaults.yaml
Resource       common.robot
Resource       ../pages/search_page.robot
Resource       ../pages/results_page.robot