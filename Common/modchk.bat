@echo off
set MODRET=
if "%2"=="" goto :END
set CHKLST=%2
set CHKLST=%CHKLST:_= %
set MODVAR=%1
call :MODCHK %CHKLST:"=%
:MODCHK
if "%1"=="%MODVAR%" (set MODRET=y
goto :END
)
shift
if not "%1"=="" goto :MODCHK
:END
