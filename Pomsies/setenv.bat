@echo off
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVPRJ=Pomsies
set DEVDIR=%DEVPRJ%
set SVNPRJ=Grumblies
set DEVBRA=version8
set ISSLST="q%DEVPRJ%_mtp.hdb q%DEVPRJ%.hdb"
set ISSPTH="C:\Users\%USERNAME%\Google Drive\FW Docs\2018 Projects\%DEVDIR%\Deliverables\Firmware"
set BINPTH="C:\Source\Grumblies\branches\%DEVBRA%\GPCD\q%DEVPRJ%\Release"
set SVNADR=46.31.169.162:8443
set SVNDIR=svn/SkyRocketToys
set SVNSUB=tags
set SVNDBG=Debug
set SVNREL=Release
set ZIPFLG=n
set CPYFLG=y
set BRDCOD=GP
set PRDCOD=Pomsies
set ISSDEF=%ISSPRD%
