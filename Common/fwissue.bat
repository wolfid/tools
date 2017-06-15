@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdate%~x0"
set GETREV="%~dp0..\%DEVCOM%\getrev%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
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
call %ENVCHK% JUSTDOIT %GETREV% %1 %SVNPTH%
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
call %ENVCHK% JUSTDOIT %GETDAT% %1 %BINPTH%
echo ###########################################################
echo ### Binary File Date: %dd%%mmm%%yyyy% %hour%:%min%:%sec%
echo ###########################################################
set ISSPTH="%ISSDRV%:\%ISSDIR:"=%\%PRDDIR:"=%\%FMWPRF%%SNXPRF%%PRDCOD%%SNXSUF%%SVNREV%_%dd%%mmm%%yyyy%"
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
if "%1"=="" goto :DOCOPY_ERR
if "%2"=="" goto :DOCOPY_ERR_2
echo ### Copying the following to %1:
if "%INTMOD%"=="y" pause
if not exist %1 md %1
set CPYPTH=%1
:DOCOPY_CHK
shift
if "%1"=="" goto :DOCOPY_PTH
echo ### %1;
if "%INTMOD%"=="y" pause
%CPYCMD% %CPYFLG:"=% %1 %CPYPTH%
goto :DOCOPY_CHK
:DOCOPY_ERR
echo ### No Destination Specified
goto :DOCOPY_EXIT
:DOCOPY_ERR_2
echo ### Nothing to Copy
goto :DOCOPY_EXIT
:DOCOPY_PTH
echo ### 
:DOCOPY_EXIT
echo ###########################################################
exit /b 0
:END
