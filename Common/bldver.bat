@echo off
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
if not "%SCSREV%"=="" goto :PRDTYP
call %GETREV% %1 %SCSPTH% %RMEFIL%
if "%SCSREV%"=="%SCSUNV%" set SCSREV=%SCSDEF%
:PRDTYP
if "%PRDCOD%"=="" call %PRDCHK%
:END