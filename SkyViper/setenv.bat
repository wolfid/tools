@echo off
echo ###########################################################
echo ###                               ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=WPA2
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
set PRJDIR="Projects"
set SUBDIR="sonix_firmware"
set ISSDRV=T
set ISSDIR="Firmware2017"
set SVNADR="46.31.169.162:8443"
set SVNDIR="SkyRocketToys"
set SVNPRJ="SkyViperVideoProto"
set SNXFMW="Sonix_Firmware"
set SVNBRA="branch"
set SDKDIR=snx_sdk
set CFGLST[1]=CONFIG_APP_SPIDERDRONE
set CFGLST[2]=CONFIG_APP_STREAMING
set CFGSET[1]=y
set CFGSET[2]=y
set PRDTYP[1]=SpiderDrone_WiFi
set PRDTYP[2]=Streaming
set PRDDIR[SpiderDrone_WiFi]="SpiderDrone_WiFi"
set PRDDIR[Streaming]="Streaming"
set PRDCOD[SpiderDrone_WiFi]=01749
set PRDCOD[Streaming]=01735
set ISSMOD=ALL
set SVNDRV=Z
set BRADIR=
set MAKDIR="buildscript"
set MAKCMD="make; if [ $? -eq 0 ]; then make install; fi"
set MAKVMD=REMOTE
set MAKVER=1
set MAKCMD="make MAKVER=!MAKVER! SVNREV=!SVNREV! PRDCOD=!PRDCOD! BLDLVL=!BLDLVL! SVNTAG=!SVNTAG!"; if [ $? -eq 0 ]; then make install; fi"
set CLNCMD="make clean"
set CFGDIR="include\config"
set CFGEXT=conf
set IMGAPP="app"
set IMGTYP="dashcam"
set IMGSRC="src"
set IMGDIR="image"
set SNXBIN=FIRMWARE_660R
set SNXFEX=_F
set SNXPHY=PHY-SF
set SNXEXT=bin
set ISSLST="%SNXBIN%.%SNXEXT% %SNXBIN%%SNXFEX%.%SNXEXT% %SNXPHY%.%SNXEXT%"
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
