@ECHO off
ECHO Bootstrapping WSL environmnet for user:  %USERNAME%

ECHO Allowing Sideloading of Apps...
reg query "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowAllTrustedApps" /d "1"

ECHO Putting machine into Developer Mode...
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"

ECHO Turning on WSL...
dism /online /enable-feature /featurename:Microsoft-Windows-Subsystem-Linux

ECHO Building WSL environment...
lxrun /install /y
