@echo off
echo ###########################################################
echo ###                            ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=H62-support
set DEVDIR=Drones
set SDKVER=SN986_1.20_85a_20170120_1237
set BLDTGT=192.168.56.104
set BLDUSR=ubuntu
set BLDPWD=ubuntu
set TGTADR=192.168.99.1
set TGTPRT=8080
set TGTTIM=3
set RSPPRT=49153
set RSPTIM=120
set DEVPRT=2017
set SDCDRV=E
set SDCDIR="\"
set PRJDRV=W
set PRJDIR=Projects
set SUBDIR=sonix_firmware
set ISSDRV=T
set ISSDIR="Firmware2017"
set SVNADR="46.31.169.162:8443"
set SVNDIR="SkyRocketToys"
set SVNPRJ="SkyViperVideoProto"
set SNXFMW="Sonix_Firmware"
set SVNBRA=branch
set SVNTGS=tags
set SVNDBG=Debug
set SVNREL=Release
set SDKDIR=Sonix
set MAKDIR=buildscript
set CFGDIR=include\config
set CFGEXT=conf
set PRDDIR=SkyViperGPS
set PRDCOD=SkyViperGPS
set ISSMOD=ALL
set SVNDRV=W
set BRADIR=
set MAKCMD="make; if [ $? -eq 0 ]; then make install; fi"
set MAKVMD=LOCAL
set MAKVER=1
set CLNCMD="make clean"
set SNXBIN=FIRMWARE_660R
set SNXFEX=_F
set SNXPHY=PHY-SF
set SNXEXT=bin
set BLDTYP=FW
set BRDCOD=SX
set CTLPRF=FB
set CTLSUF=OF
set CTLEXT=hex
set UPGMOD=0
set UPGLTT=UPGLTT
set CPYFLG="/Y"
set REVDEF="const char *"
set REVEQU="="
set REVTRM=";"
set REVBEG=25
set REVEND=3
set BDVNAM=bld_version
set SDVNAM=sdk_version
set VEREXT=c
set ISSDEF=PD
set IMGDIR=image
set IMGAPP=app
set IMGTYP=dashcam
set IMGSRC=src
set BRDCOD[0]=FB
set BRDCOD[1]=SX
set UPDREV[0]=605
set UPDDAT[0]=07jul2017
set UPDREV[1]=0.2.43dc2c3
set UPDDAT[1]=20180201
set UPDTYP[0]=FlightBoard
set UPDTYP[1]=Sonix
set UPDBIN[0]=.%CTLEXT%
set UPDBIN[1]=\%SNXBIN%.%SNXEXT%
set SCSPTH[DB]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%"
set SCSPTH[PD]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%"
set SCSPTH[RC]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%"
set SCSPTH[FL]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%"
set VERPTH[DB]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%"
set VERPTH[PD]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%"
set VERPTH[RC]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%DEVTRK%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%"
set VERPTH[FL]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%DEVTRK%\%SDKDIR%\%IMGAPP%\%IMGTYP%\%IMGSRC%"
set SRCPTH[DB]="%PRJDIR%/%SUBDIR%/%DEVPRJ%/%SVNBRA%/%DEVBRA%/%SDKDIR%/%MAKDIR%"
set SRCPTH[PD]="%PRJDIR%/%SUBDIR%/%DEVPRJ%/%SVNBRA%/%DEVBRA%/%SDKDIR%/%MAKDIR%"
set SRCPTH[RC]="%PRJDIR%/%SUBDIR%/%DEVPRJ%/%DEVTRK%/%SDKDIR%/%MAKDIR%"
set SRCPTH[FL]="%PRJDIR%/%SUBDIR%/%DEVPRJ%/%DEVTRK%/%SDKDIR%/%MAKDIR%"
set CFGPTH[DB]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%\%MAKDIR%\%CFGDIR%\%SDKDIR%.%CFGEXT%"
set CFGPTH[PD]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%\%MAKDIR%\%CFGDIR%\%SDKDIR%.%CFGEXT%"
set CFGPTH[RC]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%DEVTRK%\%SDKDIR%\%MAKDIR%\%CFGDIR%\%SDKDIR%.%CFGEXT%"
set CFGPTH[FL]="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%DEVTRK%\%SDKDIR%\%MAKDIR%\%CFGDIR%\%SDKDIR%.%CFGEXT%"
set ISSLST="%SNXBIN%.%SNXEXT% %SNXBIN%%SNXFEX%.%SNXEXT% %SNXPHY%.%SNXEXT%"
set ISSPTH="C:\Users\%USERNAME%\ownCloud\2018  FW Code\%DEVPRJ%"
set BINPTH="%PRJDRV%:\%SUBDIR%\%DEVPRJ%\%SVNBRA%\%DEVBRA%\%SDKDIR%\%IMGDIR%\%IMGTYP%"
set SCSTAG=0.2
set SCSGIT=y
