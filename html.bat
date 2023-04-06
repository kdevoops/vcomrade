set OUTPUTFILE=vdiag.html
(
echo ^<html^>
echo ^<head^>
echo ^<p^>^<img src="stlogo.png"^>^<^/p^>
echo ^<title^>Diag Info^</title^>
echo ^</head^>
echo ^<body^>
echo ^<b^>^<div align="center"^>PC INFO^</div^>^</b^>
echo %date%
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
echo ^</html^>
) > %OUTPUTFILE%