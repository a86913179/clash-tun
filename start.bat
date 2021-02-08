@echo off
cd /d %~dp0

setlocal

set PATH=%PATH%;%SystemRoot%\system32;%SystemRoot%\system32\wbem;%SystemRoot%\system32\WindowsPowerShell/v1.0

for /f "delims=," %%a in ('Getmac /v /nh /fo csv') do (
  netsh interface ipv4 set dnsservers %%a static 198.18.0.2 validate=no
  netsh interface ipv6 set interface %%a routerdiscovery=disabled
)

ipconfig /release6

start clash.vbs

ipconfig /flushdns
