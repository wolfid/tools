@echo off
echo ^<!DOCTYPE HTML^> > %1
echo ^<html^> >> %1
echo ^<body^> >> %1
echo ^<b^>SDK:^</b^> %2 >> %1
echo ^<p^> >> %1
echo ^<b^>BLD:^</b^> %3 >> %1
echo ^</body^> >> %1
echo ^</html^> >> %1
