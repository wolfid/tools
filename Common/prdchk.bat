@echo off
echo ###########################################################
echo ###                                 ~\%DEVCOM%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set PRDDEX=1
setlocal enabledelayedexpansion
set PRDTYP=!PRDTYP[%PRDDEX%]!
call :PRDCHK
set PRDCOD=!PRDCOD[%PRDTYP%]!
endlocal & set PRDCOD=%PRDCOD%& set PRDTYP=%PRDTYP%
goto :END
:PRDCHK
set /a PRDDEX+=1
if "!CFGLST[%PRDDEX%]!"=="" exit /b 0
set CFGPTH=!CFGPTH[%BLDLVL%]!
call :SETPRD %CFGPTH% !CFGLST[%PRDDEX%]! !CFGSET[%PRDDEX%]! !PRDTYP[%PRDDEX%]!
goto :PRDCHK
:SETPRD
for /f "tokens=1,2 delims== eol=#" %%i in (%~1) do if "%%i"=="%2" (
if "%%j"=="%3" (
set PRDTYP=%4
exit /b 0
))
:END