@echo off
set CFGPTH="%VERPTH:"=%\%DETHTM:"=%"
echo ^<!DOCTYPE HTML^> > %CFGPTH%
echo ^<html^> >> %CFGPTH%
echo ^<body^> >> %CFGPTH%
echo ^<b^>SDK:^</b^> %SDKVER% >> %CFGPTH%
echo ^<p^> >> %CFGPTH%
echo ^<b^>BLD:^</b^> %BLDVER% >> %CFGPTH%
echo ^</body^> >> %CFGPTH%
echo ^</html^> >> %CFGPTH%
