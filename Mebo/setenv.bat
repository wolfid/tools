@echo off
echo ###########################################################
echo ###                                   ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=trunk
set DEVBRA=Mebo2.151a
set SDKVER=SN986_1.20_151a_20170512_1950
set SDKSUF=\"_Mebo2_20170703(a-law patch)\"
set DETHTM="main_flow\Mebo2\web_server\files\version_details.html"
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
set SVNDIR="SkyRocketToys"
set SVNPRJ="Mebo"
set SNXFMW="Sonix_Firmware"
set ISSDIR="Firmware2017"
set SDKDIR=snx_sdk
set PRDDIR="Mebo2"
set PRDCOD=MEBO2
set ISSMOD=ALL
set SVNDRV=Z
set SVNADR="46.31.169.162:8443"
set BRADIR=
set MAKDIR="buildscript"
set MAKVMD=LOCAL
set MAKVER=
set MAKCMD="make; if [ $? -eq 0 ]; then make install; fi"
set CLNCMD="make clean"
set CFGDIR="include\config"
set CFGEXT=conf
set IMGAPP="app"
set IMGTYP="dashcam"
set IMGSRC="src"
set IMGDIR="image"
set FMWPRF=FW_
set FMWSUF=_PD_
set UPGLTT=USE_LATEST
set UPGMOD=0
set UPGIMG=
set SNXDEX=3
set SNXREV[1]=15266
set SNXDAT[1]=01Sep2017
set SNXREV[2]=15506
set SNXDAT[2]=11Sep2017
set SNXREV[3]=15663
set SNXDAT[3]=15Sep2017
set SNXTYP=sonix
set SNXBIN=FIRMWARE_660R
set SNXFEX=_F
set SNXPHY=PHY-SF
set SNXEXT=bin
set SNXPRF=SX_
set ISSLST="%SNXBIN%.%SNXEXT% %SNXBIN%%SNXFEX%.%SNXEXT% %SNXPHY%.%SNXEXT%"
set MOBTYP=MotorBoard
set MOBDRV=C
set MOBBRA=trunk
set MOBDIR=\Source\Mebo\Motor_Firmware
set MOBSCR=\mebo-motorboard\scripts
set MOBPRF=MB_
set MOBSUF=_PD_
set MOBBIN=mebo_dfu
set MOBEXT=abin
set MOBDEX=3
set MOBREV[1]=15289
set MOBDAT[1]=01sep2017
set MOBREV[2]=15381
set MOBDAT[2]=06sep2017
set MOBREV[3]=15655
set MOBDAT[3]=15sep2017
set CPYFLG="/Y"
set BDVNAM=bld_version
set SDVNAM=sdk_version
set VEREXT=c
set SVNUNV=Unversioned
set SVNDEF=00000
set TMPDIR="C:\Source\Temp"
set RMEFIL=readme.txt
set GDVDRV=C
set GDVHOM=Users
set GDVUSR=%USERNAME%
set GDVDIR="Google Drive"
set GDVTEM="Firmware London"
set GDVPRJ="2017 Projects"
set GDVDLV="Deliverables"
set GDVFMW="Firmware"
