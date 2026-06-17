*** Settings ***
Library    DatabaseLibrary
Library    OperatingSystem
Suite Setup     Connect to database     pymysql     ${DBName}   ${DBUser}   ${DBPass}   ${DBHost}   ${DBPort}
Suite Teardown  Disconnect From Database

*** Variables ***
${DBName}       automationtesting
${DBUser}       root
${DBPass}       BGdj.10081994
${DBHost}       127.0.0.1
${DBPort}       3306

*** Test Cases ***
#Create person table
#   ${output}=  Execute SQL String  Create table person(id integer,first_name varchar(20),last_name varchar(20))
#  Log To Console    ${output}
# Should Be Equal As Strings    ${output}    None

#Insert Data in Person Table    --this is for single record
#     ${output}=  Execute SQL String  Insert into person values(101,"John","Bonador")
#    Log To Console    ${output}
#    Should Be Equal As Strings    ${output}    None

#Insert Multiple Data in Person Table    #this is for multiple record
#    ${output}=  Execute SQL Script  ./testdata/new_record.sql
#    Log To Console    ${output}
#    Should Be Equal As Strings    ${output}    None

Check John record present in Person table
    check if exists in database     select id from automationtesting.person where first_name="John"

Verify Row Count is Zero
    row count is 0  select id from automationtesting.person where first_name="Johnx"

Check Table Exist
    table must exist    person

Verify Row Count is equal to exact values
    Row Count Is Equal To X  select id from automationtesting.person where first_name="Johnx";        == 0