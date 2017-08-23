@echo off
set MODRET=
if "%2"=="" goto :END
set CHKLST=%2
set CHKLST=%CHKLST:_= %
set MODVAR=%1
call :MODCHK %CHKLST:"=%
goto :END
:MODCHK
if "%1"=="%MODVAR%" (set MODRET=y
exit /b 0
)
shift
if not "%1"=="" goto :MODCHK
exit /b 0
:END
