@echo off
REM WE MUST TURN ECHO OFF FOR THIS TO WORK PROPERLY!
REM So we do so on line 1! :)
REM This next step is very important, as we need it to look clean
cls
REM this next step is also important as certain commands in this script wont work without it 
setlocal enabledelayedexpansion
set count1=0
set count2=0
set count3=0
set count4=0
set count5=0
ECHO V5
ECHO ...............................................
ECHO PRESS 1 or 2 to select your task, or 3 to EXIT, or 4 to view credits.
ECHO ...............................................
ECHO.
ECHO 1 - Run in normal mode.
ECHO 2 - Run in alternate mode.
ECHO 3 - EXIT
ECHO 4 - View who made it.
SET /P M=Type 1 or 2 or 3 then press ENTER:
IF %M%==1 GOTO mode1
IF %M%==2 GOTO mode2
IF %M%==3 GOTO mode3
IF %M%==4 GOTO mode4
:mode1
REM Now we read the lines of text
for /f "delims=" %%a in ('Type %~dp0color_definitions.txt') do (
    set /a count1+=1
    set "Line1[!count1!]=%%a"
)
REM At this point, each line is loaded into a variable, specified by a integer ID
REM Thanks to the lovely people over at stackoverflow for the for statement I used for this
REM Store the color arguments in color_definitions.txt
for /f "delims=" %%a in ('Type %~dp0lines_of_text.txt') do (
    set /a count2+=1
    set "Line2[!count2!]=%%a"
)
pause
For /L %%i in (1,1,%count1%) do (
    color !Line1[%%i]!
    echo !Line2[%%i]!
    pause
)
goto mode3
:mode2
REM Now we read the lines of text
for /f "tokens=*" %%x in (lines_of_text.txt) do (
    set /a count3+=1
    set var1[!count3!]=%%x
)
REM At this point, each line is loaded into a variable, specified by a integer ID
REM Thanks to the lovely people over at stackoverflow for the for statement I used for this
REM Store the color arguments in color_definitions.txt
for /f "tokens=*" %%x in (color_defintions.txt) do (
    set /a count4+=1
    set var2[!count4!]=%%x
)
REM Fill up a text file with the first line being the number of times you want it to run, the second line being 1, and the third line being the number of lines in lines_of_text.txt
REM SMH, this is so much faster than in Python or any other lanugage for that matter
REM -6100m
for /f "tokens=*" %%x in (config_data.txt) do (
    set /a count5+=1
    set var3[!count5!]=%%x
)
for /L %a in (%var1_1%,%var1_2%,%var1_3%) Do color !var2[!%a]! && echo !var1[!%a]]!
goto mode3
:mode3
cls
pause
cls
exit
cls
echo Error occcured.
cls
goto terminator
:terminator
cls
exit
cls
goto terminator
:mode4
echo Made by 6100m a.k.a V1L3PLUM3 a.k.a gloom
pause
cls
goto mode3
