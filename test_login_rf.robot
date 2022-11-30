*** Settings ***
Library  SeleniumLibrary

Documentation  Suite description #automated tests for scout website

*** Variables ***
${LOGIN URL}        https://scouts-test.futbolkolektyw.pl/en
${BROWSER}          Chrome
${SIGNINBUTTON}     xpath = //*[text()= 'Sign in']
${EMAILINPUT}       xpath = //*[@id='login']
${PASSWORDINPUT}    xpath = //*[@id='password']
${PAGELOGO}         xpath = //*[@id= '__next']/form/div/div[1]/h5
${ADDNEWPLAYER}     xpath = //*[@id="__next"]/div[1]/main/div[3]/div[2]/div/div/a/button/span[1]
${NAMEINPUT}        xpath = //*[@name='name']
${SURNAMEINPUT}     xpath = //*[@name='surname']
${AGEINPUT}         xpath = //*[ @ name = 'age']
${MAININPUT}        xpath = //*[@name = 'mainPosition']
${SUBMITBUTTON}     xpath = //*[text()='Submit']
${AssertDash}       xpath = //*[@id="f961oif026"]/div[1]


*** Test Cases ***
Log in to the system
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    [Teardown]  Close Browser

Add new player
    Open login page
    Type in email
    Type in password
    Click on the Submit button
    Assert dashboard
    Click On Add New Player Button
    Type in Name
    Type in surname
    Type in age
    Type in main
    Click On A Submit Button
    Assert dashboard_02
    [Teardown]  Close Browser



*** Keywords ***
Open login page
    Open Browser  ${LOGIN URL}  ${BROWSER}
    Title Should Be     Scouts panel - sign in
Type in email
    Input Text   ${EMAILINPUT}   user07@getnada.com
Type in password
    Input Text   ${PASSWORDINPUT}   Test-1234
Click on the Submit button
    Click Element  xpath = //*[text()= 'Sign in']
Assert dashboard
    Wait Until Element Is Not Visible  ${PAGELOGO}
    Title Should Be    Scouts panel
Click on Add New Player button
    Click Element   ${ADDNEWPLAYER}
Type in name
    Input Text  ${NAMEINPUT}    Rick
Type in surname
    Input Text  ${SURNAMEINPUT}     Sanchos
Type in age
    Input Text  ${AGEINPUT}     12.12.2012
Type in Main
    Input Text  ${MAININPUT}     alcoholic
Click On A Submit Button
    Click Element   ${SUBMITBUTTON}
Assert dashboard_02
    Wait Until Element Is Not Visible  ${AssertDash}
    Capture Page Screenshot     alert.png
