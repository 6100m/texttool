@echo off
rem Paths to combine
set DIRECTORY="C:\Directory with spaces"
set FILENAME="sub directory\filename.txt"

rem Combine two paths
set COMBINED="%DIRECTORY:"=%\%FILENAME:"=%"
echo %COMBINED%

rem This is just to illustrate how the = operator works
set DIR_WITHOUT_SPACES=%DIRECTORY:"=%
echo %DIR_WITHOUT_SPACES%
pause
cls
exit