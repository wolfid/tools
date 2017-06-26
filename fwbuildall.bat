@echo off
set DSPTTL="%~dp0title%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
set CMDLST="%~dp0Common\cmdlst"
set ENVCHK="%~dp0Common\envchk%~x0"
call %ENVCHK% DSPMOD %SETENV% q
call %ENVCHK% DEVTTL %DSPTTL% %DSPMOD%
echo ###########################################################
echo ###                                    ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVPRJ %SETPRJ% %DSPMOD%
echo ###########################################################
echo ### Development Project: %DEVPRJ%
echo ###########################################################
for /f %%i in (%CMDLST:"=%) do call :CMDCHK %%i %DEVCOM%
set CMDLST="%~dp0%DEVPRJ%\cmdlst"
if exist %CMDLST% for /f %%i in (%CMDLST:"=%) do call :CMDCHK %%i %DEVPRJ%
goto :END
:CMDCHK
if not "%INTMOD%"=="y" goto :DOCMDEXE
set USRINP=n
echo ###########################################################
set /p USRINP= ### %~1(%USRINP%)?
echo ###########################################################
if "%USRINP%"=="y" goto :DOCMDEXE
exit /b 0
:DOCMDEXE
echo ###########################################################
echo ### Executing "%~dp0%2\%CMDPRF%%~1%~x0"
echo ###########################################################
call %ENVCHK% JUSTDOIT "%~dp0%2\%CMDPRF%%~1%~x0" %DSPMOD%
exit /b 0
:END
if "%INTMOD%"=="y" pause
