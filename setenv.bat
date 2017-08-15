@echo off
echo ###########################################################
echo ###                                        ~\%~nx0 ###
echo ###                                    %~t0 ###
echo ###########################################################
if "%INTMOD%"=="" set INTMOD=y
if "%DSPMOD%"=="" set DSPMOD=q
set NCTEXE="C:\Program Files (x86)\NetCat\nc.exe"
set PLKEXE="C:\Program Files (x86)\PuTTY\plink.exe"
set ZIPEXE="C:\Program Files\7-Zip\7z.exe"
set REVEXE="C:\Program Files\CollabNet\Subversion Client\svnversion.exe"
set VBMEXE="C:\Program Files\Oracle\VirtualBox\VBoxManage.exe"
set CPYCMD=copy
set CMDPRF=fw
set DEVCOM=Common
set SVNLOG="svn log -r"
set QMDLST="q_qn_qy"
set NMDLST="n_nn_ny"
set IMDLST="qy_ny"
set AMDLST="qn_nn"
