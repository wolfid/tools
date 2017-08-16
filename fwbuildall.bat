@echo off
set DSPTTL="%~dp0dspttl%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
set CMDLST="%~dp0Common\cmdlst"
set ENVCHK="%~dp0Common\envchk%~x0"
set VARLST=DSPMOD_DEVTTL_DEVPRJ
set EXELST=dspttl_setprj_setenv
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
if exist "%~dp0%DEVPRJ%\cmdlst" set CMDLST="%~dp0%DEVPRJ%\cmdlst"
for /f %%i in (%CMDLST:"=%) do call :CMDCHK %%i
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
if not exist "%~dp0%DEVPRJ%\%CMDPRF%%~1%~x0" goto :CMDCOM
echo ###########################################################
echo ### Executing "%~dp0%DEVPRJ%\%CMDPRF%%~1%~x0"
echo ###########################################################
call %ENVCHK% JSTDIT "%~dp0%DEVPRJ%\%CMDPRF%%~1%~x0" %DSPMOD%
exit /b 0
:CMDCOM
echo ###########################################################
echo ### Executing "%~dp0%DEVCOM%\%CMDPRF%%~1%~x0"
echo ###########################################################
call %ENVCHK% JSTDIT "%~dp0%DEVCOM%\%CMDPRF%%~1%~x0" %DSPMOD%
exit /b 0
:END
if "%INTMOD%"=="y" pause
