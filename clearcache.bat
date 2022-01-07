@echo off
:remove stuff from the temp, prefetch, cookies, %temp% and history
del /s /f /q c:\windows\temp\*.*
del /s /f /q C:\WINDOWS\Prefetch
del /s /f /q %temp%\*.*
deltree /y c:\windows\tempor~1
deltree /y c:\windows\temp
deltree /y c:\windows\tmp
deltree /y c:\windows\ff*.tmp
deltree /y c:\windows\history
deltree /y c:\windows\cookies
deltree /y c:\windows\recent
deltree /y c:\windows\spool\printers
del /s /f /q %windir%\temp*.*
rd /s /q %windir%\temp
md %windir%\temp
del /s /f /q %windir%\Prefetch*.*
rd /s /q %windir%\Prefetch
md %windir%\Prefetch
:: remove dllcache
del /s /f /q %windir%\system32\dllcache*.*
rd /s /q %windir%\system32\dllcache
md %windir%\system32\dllcache
del /s /f /q “%SystemDrive%\Temp”*.*
rd /s /q “%SystemDrive%\Temp”
md “%SystemDrive%\Temp”
del /s /f /q %temp%*.*
rd /s /q %temp%
md %temp%
:: delete internet files
del /s /f /q “%USERPROFILE%\Local Settings\History”*.*
rd /s /q “%USERPROFILE%\Local Settings\History”
md “%USERPROFILE%\Local Settings\History”
del /s /f /q “%USERPROFILE%\Local Settings\Temporary Internet Files”*.*
rd /s /q “%USERPROFILE%\Local Settings\Temporary Internet Files”
md “%USERPROFILE%\Local Settings\Temporary Internet Files”
del /s /f /q “%USERPROFILE%\Local Settings\Temp”*.*
rd /s /q “%USERPROFILE%\Local Settings\Temp”
md “%USERPROFILE%\Local Settings\Temp”
del /s /f /q “%USERPROFILE%\Recent”*.*
rd /s /q “%USERPROFILE%\Recent”
md “%USERPROFILE%\Recent”
del /s /f /q “%USERPROFILE%\Cookies”*.*
rd /s /q “%USERPROFILE%\Cookies”
md “%USERPROFILE%\Cookies”
:: grants  it premission so it can delete 
takeown /F C:\Windows.old* /R /A
pause
cacls C:\Windows.old*.* /T /grant administrators:F
pause
rmdir /S /Q C:\Windows.old\
echo.
attrib -h -r -s %windir%\system32\catroot2
attrib -h -r -s %windir%\system32\catroot2.
::stop windows services
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
Ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
Ren C:\Windows\System32\catroot2 Catroot2.old
net start wuauserv
net start cryptSvc
net start bits
net start msiserver
%windir%\system32\rundll32.exe advapi32.dll,ProcessIdleTasks
cleanmgr.exe
ms-settings:storagesense
echo.
echo Task completed successfully…
echo.
PAUSE
