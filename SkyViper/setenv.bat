@echo off
echo ###########################################################
echo ###                               ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=WPA2
set DEVDIR=Drones
set SDKVER=SN986_1.20_85a_20170120_1237
set BLDTGT=192.168.56.101
set BLDUSR=sonix_user
set BLDPWD=sonix
set TGTADR=192.168.99.1
set TGTPRT=8080
set TGTTIM=3
set RSPPRT=49153
set RSPTIM=120
set DEVPRT=2017
set SDCDRV=E
set SDCDIR="\"
set PRJDRV=Z
set PRJDIR=Projects
set SUBDIR=sonix_firmware
set ISSDRV=T
set ISSDIR="Firmware2017"
set SVNADR=46.31.169.162:8443
set SVNDIR=SkyRocketToys
set SVNPRJ=SkyViperVideoProto
set SNXFMW=Sonix_Firmware
set SVNBRA=branch
set SVNTGS=tags
set SVNDBG=Debug
set SVNREL=Release
set SDKDIR=snx_sdk
set MAKDIR=buildscript
set CFGDIR=include\config
set CFGEXT=conf
set CFGLST[1]=CONFIG_APP_SPIDERDRONE
set CFGLST[2]=CONFIG_APP_STREAMING
set CFGLST[3]=CONFIG_APP_HYBRID
set CFGSET[1]=y
set CFGSET[2]=y
set CFGSET[3]=y
set PRDTYP[1]=SpiderDrone_WiFi
set PRDTYP[2]=Streaming
set PRDTYP[3]=Hybrid
set PRDDIR[SpiderDrone_WiFi]="SpiderDrone_WiFi"
set PRDDIR[Streaming]="Streaming"
set PRDDIR[Hybrid]="Hybrid"
set PRDCOD[SpiderDrone_WiFi]=01749
set PRDCOD[Streaming]=01735
set PRDCOD[Hybrid]=01735H
set ISSMOD=ALL
set SVNDRV=Z
set BRADIR=
set MAKCMD="make; if [ $? -eq 0 ]; then make install; fi"
set MAKVMD=LOCAL
set MAKVER=1
set MAKCMD="make MAKVER=!MAKVER! SCSREV=!SCSREV! PRDCOD=!PRDCOD! BLDLVL=!BLDLVL! SCSTAG=!SCSTAG!"; if [ $? -eq 0 ]; then make install; fi"
set CLNCMD="make clean"
set SNXBIN=FIRMWARE_660R
set SNXFEX=_F
set SNXPHY=PHY-SF
set SNXEXT=bin
set BLDTYP=FW
set BRDCOD=SX
set SNXSUF=_PD_
set CTLPRF=FB_
set CTLSUF=_OF_
set CTLEXT=hex
set UPGMOD=0
set UPGLTT=UPGLTT
set UPGTYP=SpiderDrone_WiFi
set SNXDEX=1
set SNXREV[1]=14865
set SNXDAT[1]=26jul2017
set CTLDEX=1
set CTLREV[1]=605
set CTLDAT[1]=07jul2017
set CPYFLG="/Y"
set BDVNAM=bld_version
set BDTNAM=bdt_version
set SDVNAM=sdk_version
set VEREXT=c
set ISSDEF=PD
set IMGDIR=image
set IMGAPP=app
set IMGTYP=dashcam
set IMGSRC=src
set SCSPTH[DB]="https://%SVNADR%/svn/%SVNDIR%/%SVNPRJ%/%SNXFMW%/%SVNBRA%/%DEVBRA%"
set SCSPTH[PD]="https://%SVNADR%/svn/%SVNDIR%/%SVNPRJ%/%SNXFMW%/%SVNBRA%/%DEVBRA%"
set SCSPTH[RC]="https://%SVNADR%/svn/%SVNDIR%/%SVNPRJ%/%SNXFMW%/%SVNBRA%/%DEVBRA%"
set SCSPTH[FL]="https://%SVNADR%/svn/%SVNDIR%/%SVNPRJ%/%SNXFMW%/%SVNBRA%/%DEVBRA%"
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
set SCSTAG=0.1
