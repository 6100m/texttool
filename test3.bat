@echo off
setlocal

set C1=apple
set C2=orange
set C3=banana

set num=2


:: Inefficient way without delayed expansion
:: This will be noticeably slow if used in a tight loop with many iterations
call echo %%C%num%%%

:: The remaining methods require delayed expansion
setlocal enableDelayedExpansion

:: Efficient way 1
echo(
echo !C%num%!

:: Efficient way 2 - useful if inside parenthesized block
:: where %num% will not give current value
echo(
for %%N in (!num!) do echo !C%%N!

:: Showing all values via a loop
echo(
for /l %%N in (1 1 3) do echo !C%%N!

pause