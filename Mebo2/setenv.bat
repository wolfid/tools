@echo off
echo ###########################################################
echo ###                                  ~\%DEVPRJ%\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
set DEVTRK=Trunk
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
set PRJDIR=Projects
set SUBDIR=sonix_firmware
set ISSDRV=T
set SVNDIR="SkyRocketToys"
set SVNPRJ="Mebo"
set SNXFMW="Sonix_Firmware"
set ISSDIR="Firmware2017"
set SDKDIR=snx_sdk
set PRDTYP[1]=Mebo2
set PRDCOD[Mebo2]=01750
set PRDDIR[Mebo2]="Mebo2"
set CFGLST[1]=CONFIG_APP_MEBO2
set CFGSET[1]=y
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
set BLDTYP=FW
set BLDLVL=_PD_
set UPGLTT=UPGLTT
set UPGMOD=1
set SNXTYP=sonix
set SCSPTH[DB]="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%DEVBRA%"
set SCSPTH[PD]="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%DEVBRA%"
set SCSPTH[RC]="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%DEVBRA%"
set SCSPTH[FL]="https://%SVNADR:"=%/svn/%SVNDIR:"=%/%SVNPRJ:"=%/%SNXFMW:"=%/%DEVBRA%"
set VERPTH[DB]="%PRJDRV%:\%SUBDIR%\%DEVBRA%"
set VERPTH[PD]="%PRJDRV%:\%SUBDIR%\%DEVBRA%"
set VERPTH[RC]="%PRJDRV%:\%SUBDIR%\%DEVBRA%"
set VERPTH[FL]="%PRJDRV%:\%SUBDIR%\%DEVBRA%"
set SRCPTH[DB]="%PRJDIR%/%SUBDIR%/%DEVBRA%/%SDKDIR%/%MAKDIR%"
set SRCPTH[PD]="%PRJDIR%/%SUBDIR%/%DEVBRA%/%SDKDIR%/%MAKDIR%"
set SRCPTH[RC]="%PRJDIR%/%SUBDIR%/%DEVBRA%/%SDKDIR%/%MAKDIR%"
set SRCPTH[FL]="%PRJDIR%/%SUBDIR%/%DEVBRA%/%SDKDIR%/%MAKDIR%"
set SNXUPG=1
set SNXDEX=6
set SNXREV[1]=15266
set SNXDAT[1]=01Sep2017
set SNXREV[2]=15506
set SNXDAT[2]=11Sep2017
set SNXREV[3]=15663
set SNXDAT[3]=15Sep2017
set SNXREV[4]=15687
set SNXDAT[4]=18Sep2017
set SNXREV[5]=15767
set SNXDAT[5]=20Sep2017
set SNXREV[6]=16034
set SNXDAT[6]=02Oct2017
set SNXBIN=FIRMWARE_660R
set SNXFEX=_F
set SNXPHY=PHY-SF
set SNXEXT=bin
set BRDCOD=SX
set ISSLST="%SNXBIN%.%SNXEXT% %SNXBIN%%SNXFEX%.%SNXEXT% %SNXPHY%.%SNXEXT%"
set CTLTYP=MotorBoard
set CTLUPG=0
set CTLDRV=C
set CTLBRA=trunk
set CTLDIR=\Source\Mebo\Motor_Firmware
set CTLSCR=\mebo-motorboard\scripts
set CTLPRF=MB_
set CTLSUF=_PD_
set CTLBIN=mebo_dfu
set CTLEXT=abin
set CTLDEX=4
set CTLREV[1]=15289
set CTLDAT[1]=01sep2017
set CTLREV[2]=15650
set CTLDAT[2]=15sep2017
set CTLREV[3]=15655
set CTLDAT[3]=15sep2017
set CTLREV[4]=15765
set CTLDAT[4]=20Sep2017
set CPYFLG="/Y"
set BDVNAM=bld_version
set BDTNAM=bdt_version
set SDVNAM=sdk_version
set VEREXT=c
set TMPDIR="C:\Source\Temp"
set RMEFIL=readme.txt
set USEGDV=y
set GDVDRV=C
set GDVHOM=Users
set GDVUSR=%USERNAME%
set GDVDIR="Google Drive"
set GDVTEM="Firmware London"
set GDVPRJ="2017 Projects"
set GDVDLV="Deliverables"
set GDVFMW="Firmware"
set MBOPWD="12345678"
set MBOCHN="7"
set SCSTAG=0.1
