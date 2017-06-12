@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set CMDEXE="%~dp0..\%DEVCOM%\cmdexe%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdate%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                 ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if not "%SVNDRV%"=="" set SVNPTH=%SVNDRV:"=%:
if not "%SVNDIR%"=="" set SVNPTH="%SVNPTH:"=%%SVNDIR:"=%"
if not "%SUBDIR%"=="" set SVNPTH="%SVNPTH:"=%\%SUBDIR:"=%"
if not "%DEVBRA%"=="%DEVTRK%" set SVNPTH="%SVNPTH:"=%\%DEVBRA:"=%"
call %CMDEXE% %GETREV% %1 %SVNPTH%
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.conf"
) else set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.conf"
set PRDCOD=%DEFCOD%
set PRDDIR=%DEFDIR%
call :SETPRD %CFGPTH% %STRCFG% %STRSET% %STRCOD% %STRDIR%
echo ###########################################################
echo ### Product Directory/Code: %PRDDIR:"=%/%PRDCOD%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%SDKDIR%\%IMGDIR:"=%"
) else set BINPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%"
set PHYPTH="%BINPTH:"=%\%IMGPHY%.%IMGEXT%"
set FEXPTH="%BINPTH:"=%\%IMGBIN%%IMGFEX%.%IMGEXT%"
set BINPTH="%BINPTH:"=%\%IMGBIN%.%IMGEXT%"
call %CMDEXE% %GETDAT% %1 %BINPTH%
echo ###########################################################
echo ### Binary File Date: %dd%%mmm%%yyyy% %hour%:%min%:%sec%
echo ###########################################################
set ISSPTH="%ISSDRV%:\%ISSDIR:"=%\%PRDDIR:"=%\%SNXPRF%%PRDCOD%%SNXSUF%%SVNREV%_%dd%%mmm%%yyyy%"
call :DOCOPY "%ISSPTH:"=%" %BINPTH% %PHYPTH% %FEXPTH%
goto :END
:SETPRD
echo ###########################################################
echo ### Search for %2 in %1
echo ###########################################################
for /f "tokens=1,2 delims== eol=#" %%i in (%~1) do if "%%i"=="%2" (
if "%%j"=="%3" (
set PRDCOD=%4
set PRDDIR=%5
exit /b 0
))
exit /b 0
:DOCOPY
echo ###########################################################
echo ### Copying %2, %3, %4 to %1
echo ###########################################################
if "%INTMOD%"=="y" pause
if not exist %1 md %1
if not "%4"=="" %CPYCMD% %CPYFLG:"=% %4 %1
if not "%3"=="" %CPYCMD% %CPYFLG:"=% %3 %1
if not "%2"=="" %CPYCMD% %CPYFLG:"=% %2 %1
exit /b 0
:END
