@echo off
set GETDAT="%~dp0..\%DEVCOM%\getdat%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set PRDCHK="%~dp0..\%DEVCOM%\prdchk%~x0"
if "%BLDLVL%"=="%BLDLDB%" goto :DBGTAG
if "%BLDLVL%"=="%BLDLPD%" goto :DBGTAG
set SVNURL="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSTAG:"=%/%TAGREL:"=%"
goto :SVNURL
:DBGTAG
set SVNURL="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSTAG:"=%/%TAGDBG:"=%"
:SVNURL
echo ###########################################################
echo ### Repo Location: %SVNURL:"=%
echo ###########################################################
for /f %%i in ('%SVNLST:"=% %SVNURL:"=%') do set SVNTAG=%%i
if "%SVNTAG%"=="" (if "%BLDLVL%"=="%BLDLDB%" (set SVNTAG=0.1
) else goto :ERRTAG
) else set SVNTAG=%SVNTAG:~0,-1%
echo ###########################################################
echo ### SVN Tag: %SVNTAG:"=%
echo ###########################################################
:BLDVER
if not "%SVNREV%"=="" goto :PRDTYP
if "%BLDLVL%"=="%BLDLDB%" (set SVNURL="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%DEVPRJ:"=%/%SCSBRA:"=%/%DEVBRA%"
) else set SVNURL=%SVNURL%/%SVNTAG%
call %GETREV% %1 %SVNURL%
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
if "%BLDLVL%"=="%BLDLDB%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSBRA%\%DEVBRA%\%BDVNAM%.%VEREXT%"
) else if "%BLDLVL%"=="%BLDLPD%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGDBG%\%SVNTAG%\%BDVNAM%.%VEREXT%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGREL%\%SVNTAG%\%BDVNAM%.%VEREXT%"
echo const char *%BDVNAM%="%BLDVER%"; > %VERPTH%
goto :END
:ERRTAG
echo ###########################################################
echo ### No Tag
echo ###########################################################
:END