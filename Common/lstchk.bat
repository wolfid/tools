@echo off
if not exist %1 goto :LSTERR
echo ###########################################################
echo ### List to Choose From:
set /a LSTMIN=1
set /a LSTCNT=%LSTMIN%
for /f %%i in (%~1) do call :DSPLST %%i %2
echo ###########################################################
set /a LSTNUM=%LSTCNT%-1
:SELENT
set SELENT=%CURDEX%
echo ###########################################################
set /p SELENT= ### Enter Number of Entry in List(%CURDEX%)?
echo ###########################################################
if "%SELENT%"=="%CURDEX%" goto :ENTSAME
if %SELENT% lss %LSTMIN% goto :ENTERR
if %SELENT% gtr %LSTNUM% goto :ENTERR
set /a LSTCNT=%LSTMIN%
for /f %%i in (%~1) do call :CHKENT %%i %SELENT% %2
goto :END
:ENTERR
echo ###########################################################
echo ### Out of Range: %LSTMIN%..%LSTNUM%
echo ###########################################################
goto :SELENT
:DSPLST
echo ### %LSTCNT:"=%. %~1
if "%~1"=="%~2" set CURDEX=%LSTCNT%
:LSTCNT
set /a LSTCNT+=1
exit /b 0
:CHKENT
if %LSTCNT% gtr %LSTNUM% exit /b 0
if not "%LSTCNT%"=="%2" goto :LSTCNT
echo ###########################################################
echo ### List Entry Chosen: %~1
echo ###########################################################
set SELENT=%1
set /a LSTCNT=%LSTNUM%+1
exit /b 0
:ENTSAME
echo ###########################################################
echo ### No Change
echo ###########################################################
set SELENT=
goto :END
:LSTERR
echo ###########################################################
echo ### %1 does not exist
echo ###########################################################
:END
