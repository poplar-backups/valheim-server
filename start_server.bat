@echo off
title Village Valheim Server
set SteamAppId=892970

:start
echo Starting server
valheim_server -nographics -batchmode -name "Village" -port 2456 -world "Dedicated" -password %VALPASS%

:backup
echo Backing up files
git add start_server.bat
copy C:\Users\Admin\AppData\LocalLow\IronGate\Valheim\worlds\Dedicated.db C:\Users\Admin\Documents\VALHEIM_SERVER
git add Dedicated.db
copy C:\Users\Admin\AppData\LocalLow\IronGate\Valheim\worlds\Dedicated.fwl C:\Users\Admin\Documents\VALHEIM_SERVER
git add Dedicated.fwl
git commit -m "Server Save on %date% at %time%"
git push

:reboot
echo Server is currently off!
echo Press any key to restart the server.
pause >nul
goto :start