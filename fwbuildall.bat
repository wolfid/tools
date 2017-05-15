@echo off
set ENVCHK="%~dp0Common\envchk%~x0"
set CMDEXE="%~dp0Common\cmdexe%~x0"
set DSPTTL="%~dp0title%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
set CMDLST="%~dp0cmdlst"
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
for /f %%i in (%CMDLST:"=%) do call :CMDCHK %%i
goto :END
:CMDCHK
if exist "%~dp0%DEVPRJ%\%FMWPRF%%~1%~x0" (set EXEPTH="%~dp0%DEVPRJ%\%FMWPRF%%~1%~x0"
) else if exist "%~dp0%DEVCOM%\%FMWPRF%%~1%~x0" (set EXEPTH="%~dp0%DEVCOM%\%FMWPRF%%~1%~x0"
) else exit /b 0
echo ###########################################################
echo ### Execute %EXEPTH% ?
echo ###########################################################
if not "%INTMOD%"=="y" goto :DOCMDEXE
set USRINP=n
echo ###########################################################
set /p USRINP= ### %~1(%USRINP%)?
echo ###########################################################
if "%USRINP%"=="y" goto :DOCMDEXE
exit /b 0
:DOCMDEXE
call %CMDEXE% %EXEPTH% %DSPMOD%
exit /b 0
:END
if "%INTMOD%"=="y" pause
