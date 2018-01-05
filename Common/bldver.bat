@echo off
set GETDAT="%~dp0..\%DEVCOM%\getdat%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
if not "%SVNREV%"=="" goto :PRDTYP
if "%BLDLVL%"=="%BLDLDB%" (set SVNURL="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSBRA:"=%/%DEVBRA%"
) else set SVNURL=%SVNURL:"=%/%SVNTAG%
if "%BLDLVL%"=="%BLDLDB%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSBRA%\%DEVBRA%"
) else if "%BLDLVL%"=="%BLDLPD%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGDBG%\%SVNTAG%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGREL%\%SVNTAG%"
if not "%RMEFIL%"=="" set RMEFIL="%VERPTH:"=%\%RMEFIL:"=%"
call %GETREV% %1 %SVNURL% %RMEFIL%
if "%SVNREV%"=="%SVNUNV%" set SVNREV=%SVNDEF%
:PRDTYP
if "%PRDCOD%"=="" call %PRDCHK%
if "%SVNREV%"=="%SVNDEF%" goto :GETDAT
if "%BLDLVL%"=="%BLDLDB%" goto :GETDAT
goto :BLDVER
:GETDAT
call %GETDAT% %1
echo ###########################################################
echo ### Current Date: %yyyy%%mm%%dd%
echo ###########################################################
:BLDVER
set BLDVER=%PRDCOD%_%BLDTYP%_%BRDCOD%_%BLDLVL%_%SVNTAG%.%SVNREV%_%yyyy%%mm%%dd%
echo ###########################################################
echo ### BLD Version: %BLDVER%
echo ###########################################################
if not "%BDVNAM%"=="" echo const char *%BDVNAM%="%BLDVER%"; > "%VERPTH:"=%\%BDVNAM:"=%.%VEREXT:"=%"
:END