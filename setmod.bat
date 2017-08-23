@echo off
set MODCHK="%~dp0Common\modchk%~x0"
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %MODCHK% %1 %QMDLST%
if "%MODRET%"=="y" set DSPMOD=q
call %MODCHK% %1 %NMDLST%
if "%MODRET%"=="y" set DSPMOD=n
call %MODCHK% %1 %IMDLST%
if "%MODRET%"=="y" set INTMOD=y
call %MODCHK% %1 %AMDLST%
if "%MODRET%"=="y" set INTMOD=n
