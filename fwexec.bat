@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set CMDEXE="%~dp0Common\cmdexe%~x0"
set DSPTTL="%~dp0title%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
call %ENVCHK% DEVTTL %DSPTTL% %2
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ% %2
echo ###########################################################
echo ### Development Project: %DEVPRJ%
echo ###########################################################
call %ENVCHK% INTMOD %SETENV% %2
echo ###########################################################
echo ### Interactive Mode: %INTMOD%
echo ###########################################################
if "%1"=="" goto :DOCOMEXE
if "%1"=="q" goto :DOCOMEXE
set COMEXE="%~dp0%DEVCOM%\%~1%~x0"
set PRJEXE="%~dp0%DEVPRJ%\%~1%~x0"
goto :DOPRJEXE
:DOCOMEXE
set COMEXE="%~dp0%DEVCOM%\%~nx0"
set PRJEXE="%~dp0%DEVPRJ%\%~nx0"
:DOPRJEXE
if exist %PRJEXE% (call %CMDEXE% %PRJEXE% %1
) else call %CMDEXE% %COMEXE% %1
:END
if "%INTMOD%"=="y" pause
