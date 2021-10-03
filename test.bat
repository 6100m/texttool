@echo off
setlocal enabledelayedexpansion

set count=0

for /f "tokens=*" %%x in (dummy_data.txt) do (
    set /a count+=1
    set var[!count!]=%%x
)
echo %var[4]%
pause >nul