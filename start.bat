@echo off

cd /d %~dp0

cscript clash.vbs

for /f "delims=," %%a in ('Getmac /v /nh /fo csv') do (
  netsh interface ipv4 set dnsservers %%a static 198.18.0.2 validate=no
  netsh interface ipv6 set interface %%a routerdiscovery=disabled
)

ipconfig /release6

ipconfig /flushdns
