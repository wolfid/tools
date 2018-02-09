@echo off
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
if "%INTMOD%"=="" set INTMOD=n
if "%DSPMOD%"=="" set DSPMOD=q
set VBMEXE="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
set ZIPEXE="C:\Program Files\7-Zip\7z.exe"
set PLKEXE="C:\Program Files\PuTTY\plink.exe"
set NCTEXE="C:\Program Files (x86)\NetCat\nc.exe"
set CRLEXE="C:\Program Files (x86)\Curl\curl.exe"
set CPYCMD=copy
set CMDPRF=fw
set DEVCOM=Common
set BLDLDB=DB
set BLDLPD=PD
set BLDLRC=RC
set BLDLFL=FL
set BLDSKP=BLDSKP
set SCSUNV=Unversioned
set SCSDEF=99999
set SVNDBG=SVNDBG
set SVNPRD=SVNPRD
set SVNREL=SVNREL
set SVNFIN=SVNFIN
set SVNLTT=SVNLTT
set SVNCKO="svn co"
set SVNUPD="svn up"
set SVNLOG="svn log"
set SVNLST="svn ls"
set SVNCPY="svn copy"
set SVNEOL="-"
set SVNLPR="-r"
set QMDLST="q_qn_qy"
set NMDLST="n_nn_ny"
set IMDLST="qy_ny"
set AMDLST="qn_nn"
set NPPEXE=y
set SCSTRK=trunk
set SCSSTG=stage
set SCSBRA=branches
set SCSTAG=tags
set TAGREL=release
set TAGDBG=debug
set TAGNUL=0.0
set TAGDEF=0.1
set ISSDBG=DB
set ISSPRD=PD
set ISSPRC=RC
set ISSFIN=FL
