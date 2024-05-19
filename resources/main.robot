*** Settings ***
Library    SeleniumLibrary
Library    FakerLibrary    locale=pt_BR

### Shared ###
Resource    shared/setup_teardown.robot


### Pages ###
Resource    pages/login_demo.robot
Resource    pages/navegacao_demo.robot


