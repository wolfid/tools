@echo off
echo ###########################################################
echo ###                                   ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=followme
set SDKVER=TEST_SDK
set SVNDIR=SkyRocketToys
set PRDCOD=Test
set PRDDIR="Test"
set ISSMOD=ALL
set SVNDRV=Z
set SVNADR=46.31.169.162:8443
set SVNTGS=tags
set SVNDBG=debug
set SVNREL=release
set BRADIR=
set MAKVMD=LOCAL
set MAKVER=
set MAKCMD="n"
set CLNCMD="make clean"
set BLDTYP=FW
set BRDCOD=NA
set CPYFLG="/Y"
set REVDEF="const char *"
set REVEQU="="
set REVTRM=;
set REVBEG=25
set REVEND=3
set LVLBEG=36
set LVLLEN=2
set BDVNAM=bld_version
set SDVNAM=sdk_version
set BLDDEF=%BLDLPD%
set VEREXT=c
set TMPDIR="C:\Source\Temp"
set RMEFIL=
set SCSPTH[DB]="https://%SVNADR%/svn/%SVNDIR%/%DEVPRJ%/%SVNTGS%/%SVNDBG%"
set SCSPTH[PD]="https://%SVNADR%/svn/%SVNDIR%/%DEVPRJ%/%SVNTGS%/%SVNDBG%"
set SCSPTH[RC]="https://%SVNADR%/svn/%SVNDIR%/%DEVPRJ%/%SVNTGS%/%SVNREL%"
set SCSPTH[FL]="https://%SVNADR%/svn/%SVNDIR%/%DEVPRJ%/%SVNTGS%/%SVNREL%"
set VERPTH[DB]="C:\Source\%DEVPRJ%\branches\%DEVBRA%"
set VERPTH[PD]="C:\Source\%DEVPRJ%\branches\%DEVBRA%"
set VERPTH[RC]="C:\Source\%DEVPRJ%\trunk"
set VERPTH[FL]="C:\Source\%DEVPRJ%\trunk"
set ISSLST="makefile"
set ISSPTH="C:\Users\%USERNAME%\ownCloud\2018  FW Code\%DEVPRJ%"
set BINPTH="C:\Source\Test\branches\followme"
