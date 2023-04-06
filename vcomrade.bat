@ echo off
rem get-localuser
rem new-localuser user
rem add-localgroupmember member
rem get-localgroummember group
rem Set-NetFirewallProfile -Enabled False *
rem agent104343.exe

color 3F
title vcomrade by Kirill V
:restart
rem Header
echo vcomrade v.0.0.3 by Kirill V
echo Support E-mail: help@3093609.ru
echo.
rem PCINFO
echo ___PC INFO___
echo %date% %time%
<nul set /p strTemp=User: 
<nul set /p strTemp= & whoami /user
<nul set /p strTemp=PCname: 
<nul set /p strTemp= & hostname
echo.
echo OS:_____ & osversion
echo.
(echo TeamviewerID HEX:) & (reg query HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\TeamViewer /v ClientID) | findstr ClientID
echo.
echo IPv4 address:
ipconfig | findstr IPv4
pause
echo ________________
echo.


rem MENUs======================================
:mainmenu
rem EchoMenu
set curusr=whoami
echo Selected User: %asusr%
<nul set /p strTemp=Current User: 
<nul set /p strTemp= & %curusr%
<nul set /p strTemp=Choose your destiny:
echo.
echo 0 - Restart vcomrade
echo 1 - RunIT as ..
echo 11 - Select User
echo 2 - cmd
echo 12 - cmd runas elevate
echo ===============
echo 3 - Config Win
echo 4 - Diagnostic
echo 5 - Downloads Menu
echo 8 - Teleport
echo 100 - E X I T
echo.

rem Menu
echo.
Set /p choice="You select: "
echo.
if not defined choice goto mainmenu
if "%choice%"=="0" cls & goto restart
if "%choice%"=="1" runas /noprofile /user:%asusr% cmd.exe
if "%choice%"=="11" set /P asusr="Enter username: "
if "%choice%"=="2" (start cmd)
if "%choice%"=="21" nircmd elevatecmd runassystem cmd.exe
if "%choice%"=="3" goto winconfigmenu
if "%choice%"=="4" goto diagmenu
if "%choice%"=="5" goto downloadsmenu
if "%choice%"=="6" runas /noprofile /user:%asusr% compmgmt.msc
if "%choice%"=="8" goto teleportmenu
if "%choice%"=="100" exit
echo.
goto mainmenu



rem Downloads ===================================================================================================
:downloadsmenu
rem EchoMenuDownloads
echo Downloads Menu
echo.
echo 0 - Go to Main Menu
echo 1 - Teamviewer Start Host Setup
echo 4 - Download and install 7zip, FF, Chrome, AdobeReader
echo 10 - Sysinternals utils site, thx to Mark
echo 11 - Nirsoft utils
rem echo 12 - Disk health info
rem echo 13 - Disk mark
echo 14 - Hardware info D
echo 16 - KES Agent zip
echo 17 - Teamviewer Stockwell Host
echo 18 - Teamviewer Stockwell QS
echo 19 - Bitrix24 Destop 

rem MenuDownloads
echo.
Set /p choice="You select: "
echo.
if "%choice%"=="0" goto mainmenu
if "%choice%"=="1" (powershell.exe wget https://download.teamviewer.com/download/version_10x/TeamViewer_Host_Setup-idcbu3e9xq.exe -OutFile $env:userprofile\Downloads\TeamViewer_Host_Setup-idcbu3e9xq.exe) & start %userprofile%/Downloads/TeamViewer_Host_Setup-idcbu3e9xq
if "%choice%"=="4" (powershell.exe -NoProfile -InputFormat None -ExecutionPolicy RemoteSigned -Command "iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))" && SET "PATH=%PATH%;%ALLUSERSPROFILE%\chocolatey\bin" & choco.exe install 7zip firefox adobereader-update googlechrome -y)
if "%choice%"=="10" explorer "https://technet.microsoft.com/ru-ru/library/bb545021.aspx"
if "%choice%"=="11" explorer "http://nirsoft.net"
if "%choice%"=="14" (powershell.exe wget "https://vahra.ru/programv/hwinfo.exe" -OutFile $env:userprofile\Downloads\hwinfo.exe) & explorer.exe /select,"%userprofile%\Downloads\hwinfo.exe"
if "%choice%"=="16" (powershell.exe wget "https://vahra.ru/programv/netagent.7z" -OutFile $env:userprofile\Downloads\netagent.7z) && explorer.exe /select,"%userprofile%\Downloads\netagent.7z"
if "%choice%"=="17" (powershell.exe wget "https://download.teamviewer.com/download/version_10x/TeamViewer_Host_Setup-idcbu3e9xq.exe" -OutFile $env:userprofile\Downloads\TeamViewer_Host_Setup-idcbu3e9xq.exe) && explorer.exe /select,"%userprofile%\Downloads\TeamViewer_Host_Setup-idcbu3e9xq.exe"
if "%choice%"=="18" (powershell.exe wget "https://download.teamviewer.com/download/version_10x/TeamViewerQS-idchp6fzyg.exe" -OutFile $env:userprofile\Downloads\TeamViewerQS-idchp6fzyg.exe) && explorer.exe /select,"%userprofile%\Downloads\TeamViewerQS-idchp6fzyg.exe"
if "%choice%"=="19" (start http://dl.bitrix24.com/b24/bitrix24_desktop.exe)


goto downloadsmenu
rem /Downloads ===================================================================================================



rem WINCONFIG ========================================================================================================
:winconfigmenu
rem Echo config windows
echo Menu of WinConfig
echo.
echo 0 - Go to Main Menu
echo 11 - Control Panel
echo 12 - Admin toolbox
echo 1 - Net config
echo 2 - Printers
echo 3 - Comp management
echo 31 - add users
echo 4 - List and Add cred
echo 41 - Cred mgr
echo 5 - Remote $Admin on
echo 51 - PS Remote 
echo 6 - Installed Programs
echo 7 - Windows Update
echo 8 - RegEdit
echo 511 - Sleep monitor

echo.
Set /p choice="You select: "
echo.
if not defined choice goto mainmenu
if "%choice%"=="0" goto mainmenu
if "%choice%"=="11" control.exe
if "%choice%"=="12" control admintools
if "%choice%"=="1" ncpa.cpl
if "%choice%"=="2" control printers
if "%choice%"=="3" compmgmt.msc
if "%choice%"=="31" (powershell.exe 
if "%choice%"=="4" set /P cmdkeyserver="enter server: " & set /P cmdkeyuser="enter user: " && cmdkey /add:%cmdkeyserver% /user:%cmdkeyuser%
if "%choice%"=="41" control /name Microsoft.CredentialManager
if "%choice%"=="5" REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v LocalAccountTokenFilterPolicy /t REG_DWORD /d 00000001 /f & REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorUser /t REG_DWORD /d 00000001 /f
if "%choice%"=="51" (powershell.exe Enable-PSRemoting -SkipNetworkProfileCheck) && (powershell.exe Set-Service RemoteRegistry -StartupType Automatic)
if "%choice%"=="6" appwiz.cpl
if "%choice%"=="7" control.exe /name Microsoft.WindowsUpdate
if "%choice%"=="8" regedit.exe
if "%choice%"=="511" nircmd.exe monitor off 
goto winconfigmenu
rem /WINCONFIF ========================================================================================================

rem diagmenu =========================================================================
:diagmenu
echo.
rem PCINFO
echo ___PC INFO___
echo %date% %time%
<nul set /p strTemp=User: 
<nul set /p strTemp= & whoami
<nul set /p strTemp=PCname: 
<nul set /p strTemp= & hostname
echo.
echo OS:_____ & (wmic os get caption) & osversion.exe & echo. & (wmic os get installdate) & (wmic os get serialnumber) & (wmic os get lastbootuptime)
echo.
echo _______
echo Hardware:
echo RAM:____ & (wmic MemoryChip get BankLabel, Capacity, MemoryType, TypeDetail, Speed)
echo CPU:_______ & (wmic cpu get name)
echo HDDs:_______ & (wmic diskdrive get Name, Model, InterfaceType, MediaLoaded)
echo Free space on system drive:____ & ( wmic logicaldisk where "DeviceID='C:'" get FreeSpace) & systemdiskspace.exe
echo.
echo MAMA:______ & (wmic computersystem get model)
echo.
echo Printers:_____ & (wmic printer get name)
(echo TeamviewerID HEX:) & (reg query HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\TeamViewer /v ClientID) | findstr ClientID
echo.
echo IPv4 address:
ipconfig | findstr IPv4
pause
echo.
echo Diagnostic Menu
echo.
echo 0 - Go to Main Menu
echo 5 - DiagInfo to vdiag.txt
echo 6 - DiagInfo to vdiag.html

rem Diagmenu
echo.
Set /p choice="You select: "
echo.
if "%choice%"=="0" goto mainmenu
if "%choice%"=="5" goto diag2txt
if "%choice%"=="6" goto diag2html
goto mainmenu
rem /diagmenu =====================================================

rem teleport =========================================================================
:teleportmenu
echo Teleport Menu
echo.
echo 0 - Go to Main Menu
echo 1 - User profile+Downloads
echo 2 - Application Data 
echo 3 - All Start Menu folder+AutoStart
echo 4 - User's Start Menu folder+AutoStart


rem Diagmenu
echo.
Set /p choice="You select: "
echo.
if "%choice%"=="0" goto mainmenu
if "%choice%"=="1" explorer.exe /select,"%userprofile%\Downloads"
if "%choice%"=="2" explorer.exe /select,"%AppData%
if "%choice%"=="3" explorer.exe /select,"%ProgramData%\Microsoft\Windows\Start Menu\Programs\StartUp"
if "%choice%"=="4" explorer.exe /select,"%AppData%\Microsoft\Windows\Start Menu\Programs\Startup"
goto teleportmenu
rem /teleport =========================================================================

rem ______________________________________________________________________
rem FUNCTIONS=FUNCTIONS=FUNCTIONS
rem ______________________________________________________________________


rem diag2txt
:diag2txt
Set txtfile="%userprofile%\Downloads\vdiag_%computername%_%date%.txt"
(
echo "vcomrade v.0.0.3 by Kirill V"
echo Support E-mail: help@3093609.ru
echo.
rem PCINFO
echo ___PC INFO___
echo %date% %time%
<nul set /p strTemp=User: 
<nul set /p strTemp= & whoami
<nul set /p strTemp=PCname: 
<nul set /p strTemp= & hostname
osversion.exe
echo.
echo OS:_____ & (wmic os get caption) & (wmic os get installdate) & (wmic os get serialnumber) & (wmic os get lastbootuptime)
echo.
echo _______
echo Hardware:
echo RAM:____ & (wmic MemoryChip get BankLabel, Capacity, MemoryType, TypeDetail, Speed)
echo CPU:_______ & (wmic cpu get name)
echo HDDs:_______ & (wmic diskdrive get Name, Model, InterfaceType, MediaLoaded)
echo Free space on system drive:____ & ( wmic logicaldisk where "DeviceID='C:'" get FreeSpace) & systemdiskspace.exe
echo.
echo MAMA:______ & (wmic computersystem get model)
echo.
echo Printers:_____ & (wmic printer get name)
(echo TeamviewerID HEX:) & (reg query HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\TeamViewer /v ClientID) | findstr ClientID
echo.
echo IPv4 address:
ipconfig | findstr IPv4
echo ________________
echo.
)>"%txtfile%"
explorer.exe /select,"%userprofile%\Downloads\vdiag_%computername%_%date%.txt"
goto mainmenu
rem ========================================================================

:diag2html
set htmlfile="%userprofile%\Downloads\vdiag_%computername%_%date%.html"
(
echo ^<html^>
echo ^<head^>
echo ^<title^>Diag Info^</title^>
echo ^</head^>
echo ^<body^>
echo ^<b^>^<div align="center"^>PC INFO^</div^>^</b^>
echo %date% & echo %time%
echo ^<hr^>
echo ^<br^> 
echo ^<b^>User:^</b^> & whoami
echo ^<br^> 
echo ^<b^>PCname:^</b^> & hostname
echo ^<br^> 
osversion.exe
echo ^<br^> 
echo ^<b^>OS:^</b^> & (wmic os get caption) & (wmic os get installdate) & (wmic os get serialnumber) & (wmic os get lastbootuptime)
echo ^<br^> 
echo.
echo ^<br^> 
echo ^<hr^>
echo ^<br^> 
echo ^<b^>Hardware:^</b^>
echo ^<br^> 
echo ^<b^>RAM:^</b^> & (wmic MemoryChip get BankLabel, Capacity, MemoryType, TypeDetail, Speed)
echo ^<br^> 
echo ^<b^>CPU:^</b^>  & (wmic cpu get name)
echo ^<br^> 
echo ^<b^>HDDs:^</b^> & (wmic diskdrive get Name, Model, InterfaceType, MediaLoaded)
echo ^<br^> 
echo ^<b^>Free space on system drive:^</b^> & ( wmic logicaldisk where "DeviceID='C:'" get FreeSpace) & systemdiskspace.exe
echo ^<br^> 
echo.
echo ^<b^>MAMA:^</b^>  & (wmic computersystem get model)
echo ^<br^> 
echo.
echo ^<b^>Printers:^</b^> & (wmic printer get name)
echo ^<br^> 
(echo ^<b^>TeamviewerID HEX:^</b^>) & (reg query HKEY_LOCAL_MACHINE\SOFTWARE\Wow6432Node\TeamViewer /v ClientID) | findstr ClientID
echo ^<br^> 
echo.
echo ^<b^>IPv4 address:^</b^>
ipconfig | findstr IPv4
echo ^<br^> 
echo ^<hr^>
echo.
echo ^</body^> 
echo ^<footer^>
echo ^<div align="right"^>vcomrade v.0.0.3 Kirill V^</div^>
echo ^</footer^>
echo ^</html^>
) > "%htmlfile%"
explorer.exe /select,"%userprofile%\Downloads\vdiag_%computername%_%date%.html"
goto mainmenu




rem Podval =======================================================
rem echo Wrong! & echo(
rem goto mainmenu
pause > nul










