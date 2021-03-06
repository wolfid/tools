@echo off
set GETDAT="%~dp0..\%DEVCOM%\getdat%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set SVNPTH="%SVNDRV%:\%SNXFMW:"=%\%DEVPRJ%\%SCSTAG:"=%\%SVNREL:"=%
echo ###########################################################
echo ### Get Latest Tag From: %TAGLST:"=% %SVNPTH:"=%
echo ###########################################################
set SCSTAG=0.0
for /f %%i in ('%TAGLST:"=% %SVNPTH:"=%') do set SCSTAG=%%i
if "%SCSTAG%"=="0.0" if not "%BLDLVL%"=="%ISSPRD%" goto :ERRTAG
echo ###########################################################
echo ### SVN Tag: %SCSTAG%
echo ###########################################################
if "%SCSTAG:~-1,1%"=="0" (if "%BLDLVL%"=="%ISSPRC%" goto :ERRREL) else if "%BLDLVL%"=="%ISSFIN%" goto :ERRFNL
if "%BDTNAM%"=="" goto :END
set SCSTAG=%SCSTAG%.%SCSREV%
if "%BLDLVL%"=="%ISSPRD%" (set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSBRA%\%DEVBRA%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDTNAM%.%VEREXT%"
) else set VERPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%SVNREL%\%SCSTAG%\%SDKDIR%\%IMGAPP:"=%\%IMGTYP:"=%\%IMGSRC:"=%\%BDTNAM%.%VEREXT%"
echo ###########################################################
echo ### Build Version File: %VERPTH%
echo ###########################################################
call %GETDAT% %1
set BLDVER=%BLDTYP%_%BRDCOD%_%PRDCOD%%BLDLVL%%SCSTAG%_%dd%%mmm%%yyyy%_%hour%%min%
echo ###########################################################
echo ### Build Version: %BLDVER%
echo ###########################################################
echo const char *%BDTNAM%="%BLDVER%"; > %VERPTH%
goto :END
:ERRTAG
echo ###########################################################
echo ### Error - No Tag For Release Build
echo ###########################################################
goto :END
:ERRREL
echo ###########################################################
echo ### Error - Minor Release is 0 For Release Candidate
echo ###########################################################
goto :END
:ERRFNL
echo ###########################################################
echo ### Error - Minor Release is ~0 For Final Release
echo ###########################################################
:END
