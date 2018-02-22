@echo off
set MODCHK="%~dp0Common\modchk%~x0"
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %MODCHK% %1 %4
if "%MODRET%"=="y" set %2=q
call %MODCHK% %1 %5
if "%MODRET%"=="y" set %2=n
call %MODCHK% %1 %6
if "%MODRET%"=="y" set %3=y
call %MODCHK% %1 %7
if "%MODRET%"=="y" set %3=n
