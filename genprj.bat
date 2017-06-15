@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set DSPTTL="%~dp0title%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
set LSTCHK="%~dp0Common\lstchk%~x0"
set PRJLST="%~dp0prjlst"
call %ENVCHK% DEVTTL %DSPTTL% q
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ% q
echo ###########################################################
echo ### Current Development Project: %DEVPRJ%
echo ###########################################################
call %ENVCHK% INTMOD %SETENV% q
echo ###########################################################
echo ### Interactive Mode: %INTMOD%
echo ###########################################################
call %LSTCHK% %PRJLST% %DEVPRJ%
if not "%SELENT%"=="" echo set DEVPRJ=%SELENT%>%SETPRJ%
:END
if "%INTMOD%"=="y" pause
