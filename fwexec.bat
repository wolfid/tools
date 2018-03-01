@echo off
set DSPTTL="%~dp0dspttl%~x0"
set SETCNF="%~dp0setcnf%~x0"
set SETPRJ="%~dp0setprj%~x0"
set SETENV="%~dp0setenv%~x0"
set SETMOD="%~dp0setmod%~x0"
call %DSPTTL%
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %SETCNF%
echo ###########################################################
echo ### Configuration Location: %CNFPTH%
echo ###########################################################
call %SETPRJ%
echo ###########################################################
echo ### Development Project: %DEVPRJ%
echo ###########################################################
call %SETENV%
echo ###########################################################
echo ### Display/Interactive Mode: %DSPMOD%/%INTMOD%
echo ###########################################################
if "%2"=="" (call %SETMOD% %1 DSPMOD INTMOD %QMDLST% %IMDLST% %NMDLST% %AMDLST%
) else call %SETMOD% %2 DSPMOD INTMOD %QMDLST% %IMDLST% %NMDLST% %AMDLST%
if "%2"=="" goto :COMEXE
if exist "%~dp0%DEVPRJ%\%~1%~x0" (call "%~dp0%DEVPRJ%\%~1%~x0" %2 %3 %4 %5 %6 %7 %8 %9
) else call "%~dp0%DEVCOM%\%~1%~x0" %2 %3 %4 %5 %6 %7 %8 %9
goto :END
:COMEXE
if exist "%~dp0%DEVPRJ%\%~nx0" (call "%~dp0%DEVPRJ%\%~nx0" %DSPMOD%
) else call "%~dp0%DEVCOM%\%~nx0" %DSPMOD%
:END
if "%INTMOD%"=="y" pause
