set USRINP=
echo ###########################################################
set /p USRINP= ### Upgrade Mode 0..1 (%UPGMOD%)?
echo ###########################################################
if not "%USRINP%"=="" (set UPGMOD=%USRINP%
if not "%NPPEXE%"=="" call :NPPEXT
)
set USELTT=n
if "%UPGMOD%"=="1" (if "%SNXDEX%"=="%UPGLTT%" set USELTT=y
) else (if "%CTLDEX%"=="%UPGLTT%" set USELTT=y
)
set USRINP=
echo ###########################################################
set /p USRINP= ### Use Latest Version y/n (%USELTT%)?
echo ###########################################################
if not "%USRINP%"=="" (set USELTT=%USRINP%
if not "%NPPEXE%"=="" call :NPPEXT
)
if not "%USELTT%"=="y" goto :FMWDET
if "%UPGMOD%"=="1" (set SNXDEX=%UPGLTT%
) else set CTLDEX=%UPGLTT%
goto :END
:FMWDET
setlocal enabledelayedexpansion
if "%UPGMOD%"=="1" (set FMWREV=!SNXREV[%SNXDEX%]!
set FMWDAT=!SNXDAT[%SNXDEX%]!
) else (set FMWREV=!CTLDAT[%CTLDEX%]!
set FMWDAT=!CTLDAT[%CTLDEX%]!
)
endlocal & set FMWREV=%FMWREV% & set FMWDAT=%FMWDAT%
set USRINP=
echo ###########################################################
set /p USRINP= ### Firmware Revision (%FMWREV%)?
echo ###########################################################
if not "%USRINP%"=="" (set FMWREV=%USRINP%
if not "%NPPEXE%"=="" call :NPPEXT
)
set USRINP=
echo ###########################################################
set /p USRINP= ### Firmware Date (%FMWDAT%)?
echo ###########################################################
if not "%USRINP%"=="" (set FMWDAT=%USRINP%
if not "%NPPEXE%"=="" call :NPPEXT
)
if "%UPGMOD%"=="1" (set SNXREV=%FMWREV%
set SNXDAT=%FMWDAT%
) else (set CTLREV=%FMWREV%
set CTLDAT=%FMWDAT%
)
goto :END
:NPPEXT
set /p temp=########################################################### & echo.
exit /b 0
:END
