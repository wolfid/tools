@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set LSTCHK="%~dp0Common\lstchk%~x0"
set DSPTTL="%~dp0dspttl%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
set PRJLST="%~dp0prjlst"
call %DSPTTL% q
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETPRJ%
echo ###########################################################
echo ### Current Development Project: %DEVPRJ%
echo ###########################################################
call %SETENV% q
call %LSTCHK% %PRJLST% %DEVPRJ%
if not "%SELENT%"=="" echo set DEVPRJ=%SELENT%>%SETPRJ%
:END
if "%INTMOD%"=="y" pause
