*** Settings ***
Library        SeleniumLibrary
Library        ../resources/libs/helpers.py
Variables      ../config/defaults.yaml
Resource       ../resources/common.robot
Resource       ../pages/search_page.robot
Resource       ../pages/results_page.robot