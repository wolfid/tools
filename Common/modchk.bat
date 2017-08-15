@echo off
if "%2"=="" goto :END
set CHKLST=%2
set CHKLST=%CHKLST:_= %
call :MODCHK %1 %CHKLST:"=%
goto :END
:MODCHK
if "%1"=="" exit /b 0
set MODRET=%1
:MODCHK_LOOP
shift
if "%1"=="" (set MODRET=
exit /b 0
)
if not "%1"=="%MODRET%" goto :MODCHK_LOOP
set MODRET=q
exit /b 0
:END
