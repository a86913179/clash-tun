@echo off
cd /d %~dp0

setlocal

set PATH=%PATH%;%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%\system32\WindowsPowerShell/v1.0

taskkill /f /im clash.exe /t

for /f "delims=," %%a in ('Getmac /v /nh /fo csv') do (
  netsh interface ipv4 set dnsservers %%a dhcp validate=no
  netsh interface ipv6 set interface %%a routerdiscovery=enabled
)
