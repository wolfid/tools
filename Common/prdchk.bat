@echo off
set SETPRD="%~dp0..\%DEVCOM%\setprd%~x0"
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set PRDDEX=1
setlocal enabledelayedexpansion
set PRDTYP=!PRDTYP[%PRDDEX%]!
call :PRDCHK
echo ###########################################################
echo ### Product Type: %PRDTYP%
echo ###########################################################
set PRDCOD=!PRDCOD[%PRDTYP%]!
endlocal & set PRDCOD=%PRDCOD% & set PRDTYP=%PRDTYP%
set PRDCOD=%PRDCOD: =%
set PRDTYP=%PRDTYP: =%
echo ###########################################################
echo ### Product Code: %PRDCOD%
echo ###########################################################
goto :END
:PRDCHK
set /a PRDDEX+=1
if "!CFGLST[%PRDDEX%]!"=="" exit /b 0
set CFGPTH="%PRJDRV%:\%SUBDIR:"=%\%DEVPRJ%\%SCSTAG%\%TAGREL%\%SVNTAG%\%SDKDIR%\%MAKDIR:"=%\%CFGDIR:"=%\%SDKDIR%.%CFGEXT%"
call %SETPRD% %CFGPTH% !CFGLST[%PRDDEX%]! !CFGSET[%PRDDEX%]! !PRDTYP[%PRDDEX%]!
goto :PRDCHK
:END