@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set CMDEXE="%~dp0Common\cmdexe%~x0"
set DSPTTL="%~dp0title%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
call %ENVCHK% DEVTTL %DSPTTL% q
echo ###########################################################
echo ###                                  ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ%
echo ###########################################################
echo ### Development Project: %DEVPRJ%
echo ###########################################################
call %ENVCHK% INTMOD %SETENV%
echo ###########################################################
echo ### Interactive Mode: %INTMOD%
echo ###########################################################
if not "%INTMOD%"=="y" goto :CMDEXE
set USRINP=n
echo ###########################################################
set /p USRINP= ### %~1(%USRINP%)?
echo ###########################################################
if "%USRINP%"=="y" goto :CMDEXE
goto :END
:CMDEXE
echo ###########################################################
echo ### Call %~dp0%FMWPRF%%~1%~x0
echo ###########################################################
if exist "%~dp0%DEVPRJ%\%FMWPRF%%~1%~x0" (call %CMDEXE% "%~dp0%DEVPRJ%\%FMWPRF%%~1%~x0"
) else call %CMDEXE% "%~dp0%DEVCOM%\%FMWPRF%%~1%~x0"
if "%INTMOD%"=="y" pause
