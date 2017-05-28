@ECHO off
ECHO Bootstrapping WSL environment for user: %USERNAME%

ECHO Allowing Sideloading of Apps...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD  /v "AllowAllTrustedApps"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"

ECHO Putting machine into Developer Mode...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD  /v "AllowDevelopmentWithoutDevLicense"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"

ECHO Turning on WSL...
dism /online /get-featureinfo /featurename:Microsoft-Windows-Subsystem-Linux
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux

ECHO Building WSL environment...
lxrun /install /y
