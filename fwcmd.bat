@echo off
set DSPTTL="%~dp0title%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
set CMDLST="%~dp0Common\cmdlst"
set ENVCHK="%~dp0Common\envchk%~x0"
call %ENVCHK% DSPMOD %SETENV% q
call %ENVCHK% DEVTTL %DSPTTL% %DSPMOD%
echo ###########################################################
echo ###                                         ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ% %DSPMOD%
echo ###########################################################
echo ### Development Project: %DEVPRJ%
echo ###########################################################
set INTMOD=n
call :CMDCHK %1
goto :END
:CMDCHK
if not exist "%~dp0%DEVPRJ%\%CMDPRF%%~1%~x0" goto :CMDCOM
echo ###########################################################
echo ### Executing "%~dp0%DEVPRJ%\%CMDPRF%%~1%~x0"
echo ###########################################################
call %ENVCHK% JUSTDOIT "%~dp0%DEVPRJ%\%CMDPRF%%~1%~x0" %DSPMOD%
exit /b 0
:CMDCOM
echo ###########################################################
echo ### Executing "%~dp0%DEVCOM%\%CMDPRF%%~1%~x0"
echo ###########################################################
call %ENVCHK% JUSTDOIT "%~dp0%DEVCOM%\%CMDPRF%%~1%~x0" %DSPMOD%
exit /b 0
:END
