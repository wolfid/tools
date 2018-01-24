@echo off
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
if not "%SVNREV%"=="" goto :PRDTYP
call %GETREV% %1 %SVNURL% %RMEFIL%
if "%SVNREV%"=="%SVNUNV%" set SVNREV=%SVNDEF%
:PRDTYP
if "%PRDCOD%"=="" call %PRDCHK%
set BLDVER=%PRDCOD%_%BLDTYP%_%BRDCOD%_%BLDLVL%_%SVNTAG%.%SVNREV%_%yyyy%%mm%%dd%
if not "%BDVNAM%"=="" echo const char *%BDVNAM%="%BLDVER%"; > "%VERPTH:"=%\%BDVNAM:"=%.%VEREXT:"=%"
:END