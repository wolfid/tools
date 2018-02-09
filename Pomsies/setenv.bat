@echo off
echo ###########################################################
echo ###                                ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVPRJ=Pomsies
set DEVDIR=%DEVPRJ%
set SVNPRJ=Grumblies
set DEVBRA=version8
set SVNADR=46.31.169.162:8443
set SVNDIR=SkyRocketToys
set SVNTGS=tags
set SVNDBG=Debug
set SVNREL=Release
set ZIPFLG=n
set CPYFLG=y
set BRDCOD=GP
set PRDCOD=Pomsies
set ISSDEF=%ISSPRD%
set SCSPTH[DB]="https://%SVNADR%/svn/%SVNDIR%/%SVNPRJ%/%SVNTGS%/%SVNDBG%"
set SCSPTH[PD]="https://%SVNADR%/svn/%SVNDIR%/%SVNPRJ%/%SVNTGS%/%SVNDBG%"
set SCSPTH[RC]="https://%SVNADR%/svn/%SVNDIR%/%SVNPRJ%/%SVNTGS%/%SVNDREL%"
set SCSPTH[FL]="https://%SVNADR%/svn/%SVNDIR%/%SVNPRJ%/%SVNTGS%/%SVNDREL%"
set ISSLST="q%DEVPRJ%_mtp.hdb q%DEVPRJ%.hdb"
set ISSPTH="C:\Users\%USERNAME%\ownCloud\2018  FW Code\%DEVPRJ%"
set BINPTH="C:\Source\Grumblies\branches\%DEVBRA%\GPCD\q%DEVPRJ%\Release"
