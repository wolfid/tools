@echo off
set ENVCHK="%~dp0..\%DEVCOM%\envchk%~x0"
set CMDEXE="%~dp0..\%DEVCOM%\cmdexe%~x0"
set GETDAT="%~dp0..\%DEVCOM%\getdate%~x0"
set GETREV="%~dp0..\%DEVCOM%\getsvnrev%~x0"
set SETENV="%~dp0..\%DEVPRJ%\setenv%~x0"
echo ###########################################################
echo ###                                 ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
call %ENVCHK% DEVBRA %SETENV% %1
echo ###########################################################
echo ### Development Branch: %DEVBRA%
echo ###########################################################
if not "%SVNDRV%"=="" %SVNDRV%:
if not "%SVNDIR%"=="" cd "%SVNDIR:"=%"
cd "%SUBDIR:"=%"
if not "%DEVBRA%"=="%DEVTRK%" cd "%DEVBRA%"
call %CMDEXE% %GETREV% %1
echo ###########################################################
echo ### SVN Revision: %SVNREV%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set CFGPTH="%PRJDRV%:\%PRJDIR:"=%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.conf"
) else set CFGPTH="%PRJDRV%:\%PRJDIR:"=%\%DEVBRA%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.conf"
set PRDCOD=%DEFCOD%
set PRDDIR=%DEFDIR%
call :SETPRD %CFGPTH% %STRCFG% %STRSET% %STRCOD% %STRDIR%
echo ###########################################################
echo ### Product Directory/Code: %PRDDIR:"=%/%PRDCOD%
echo ###########################################################
if "%DEVBRA%"=="%DEVTRK%" (set BINPTH="%PRJDRV%:\%PRJDIR:"=%\%SDKDIR%\%IMGDIR:"=%"
) else set BINPTH="%PRJDRV%:\%PRJDIR:"=%\%DEVBRA%\%SDKDIR%\%IMGDIR:"=%"
set PHYPTH="%BINPTH:"=%\%IMGPHY%.%IMGEXT%"
set BINPTH="%BINPTH:"=%\%IMGBIN%.%IMGEXT%"
call %CMDEXE% %GETDAT% %1 %BINPTH%
echo ###########################################################
echo ### Binary File Date: %dd%%mmm%%yyyy% %hour%:%min%:%sec%
echo ###########################################################
set ISSPTH="%ISSDRV%:\%ISSDIR:"=%\%PRDDIR:"=%\%TGTPRF%%PRDCOD%%TGTSUF%%SVNREV%_%dd%%mmm%%yyyy%"
if "%INTMOD%"=="y" goto :USRINP
set DOCOPY=y
set DOZIP=y
if not "%ISSMOD%"=="" (if not "%ISSMOD%"=="ALL" (if "%ISSMOD%"=="COPY" (set DOZIP=n) else if "%ISSMOD%"=="ZIP" set DOCOPY=n))
goto :DOCOPY
:USRINP
set DOCOPY=n
set DOZIP=n
echo ###########################################################
set /p DOCOPY= ### Copy %BINPTH% to "%ISSPTH:"=%.%IMGEXT%"(%DOCOPY%)?
echo ###########################################################
echo ###########################################################
set /p DOZIP= ### Zip %BINPTH%, %PHYPTH% to "%ISSPTH:"=%.zip"(%DOZIP%)?
echo ###########################################################
:DOCOPY
if "%DOCOPY%"=="y" call :DOCOPY %BINPTH% "%ISSPTH:"=%.%IMGEXT%"
if "%DOZIP%"=="y" call :DOZIP "%ISSPTH:"=%.zip" %BINPTH% %PHYPTH%%
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
echo ### Copying %1 to %2
echo ###########################################################
%CPYCMD% %CPYFLG:"=% %1 %2
exit /b 0
:DOZIP
echo ###########################################################
echo ### Zipping %2, %3 to %1
echo ###########################################################
%ZIPEXE% a %1 %2 %3
exit /b 0
:END
