@echo off
if "%2"=="%ISSDBG%" (set BLDLVL=%ISSDBG%
) else if "%2"=="%ISSPRD%" (set BLDLVL=%ISSPRD%
) else if "%2"=="%ISSPRC%" (set BLDLVL=%ISSPRC%
) else if "%2"=="%ISSFIN%" set BLDLVL=%ISSFIN%
if "%BLDLVL%"=="" set BLDLVL=%BLDDEF%
