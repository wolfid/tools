@echo off
echo ###########################################################
echo ###                              ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set PRDCOD=%DEVPRJ%
set BLDTYP=FW
set BRDCOD=GP
set DEVBRA=state_machine
set SVNADR=46.31.169.162:8443
set SVNDIR=SkyRocketToys
set SVNTGS=tags
set SVNDBG=Debug
set SVNREL=Release
set SCSPTH[DB]="https://%SVNADR%/svn/%SVNDIR%/%DEVPRJ%/%SVNTGS%/%SVNDBG%"
set SCSPTH[PD]="https://%SVNADR%/svn/%SVNDIR%/%DEVPRJ%/%SVNTGS%/%SVNDBG%"
set SCSPTH[RC]="https://%SVNADR%/svn/%SVNDIR%/%DEVPRJ%/%SVNTGS%/%SVNDREL%"
set SCSPTH[FL]="https://%SVNADR%/svn/%SVNDIR%/%DEVPRJ%/%SVNTGS%/%SVNDREL%"
set VERPTH[DB]="C:\Source\Grumblies\branches\%DEVBRA%\GPCD\q%DEVPRJ%"
set VERPTH[PD]="C:\Source\Grumblies\branches\%DEVBRA%\GPCD\q%DEVPRJ%"
set VERPTH[RC]="C:\Source\Grumblies\trunk\GPCD\q%DEVPRJ%"
set VERPTH[FL]="C:\Source\Grumblies\trunk\GPCD\q%DEVPRJ%"
set ISSPTH="C:\Users\%USERNAME%\ownCloud\2018  FW Code\%DEVPRJ%"
set ISSLST="q%DEVPRJ%_otp.hdb q%DEVPRJ%_dbg.hdb q%DEVPRJ%_dbg2.hdb q%DEVPRJ%_mtp.hdb"
set BINPTH="C:\Source\Grumblies\branches\%DEVBRA%\GPCD\q%DEVPRJ%\Release"
set MAKCMD="n"
set MAKVMD=LOCAL
set REVDEF="#define "
set REVEQU=" "
set REVTRM=
set REVBEG=21
set REVEND=3
set LVLBEG=37
set LVLLEN=2
set BDVDEF="#define "
set BDVNAM=bld_version
set VEREXT=inc
