@echo off
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
if "%INTMOD%"=="" set INTMOD=n
if "%DSPMOD%"=="" set DSPMOD=q
set VBMEXE="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
set ZIPEXE="C:\Program Files\7-Zip\7z.exe"
set PLKEXE="C:\Program Files (x86)\PuTTY\plink.exe"
set NCTEXE="C:\Program Files (x86)\NetCat\nc.exe"
set CRLEXE="C:\Program Files (x86)\Curl\curl.exe"
set CPYCMD=copy
set CMDPRF=fw
set DEVCOM=Common
set SVNLOG="svn log"
set SVNLPR="-r"
set QMDLST="q_qn_qy"
set NMDLST="n_nn_ny"
set IMDLST="qy_ny"
set AMDLST="qn_nn"
set NPPEXE=y