@echo off

for /f "delims=," %%a in ('Getmac /v /nh /fo csv') do (
  netsh interface ipv4 set dnsservers %%a dhcp validate=no
  netsh interface ipv6 set interface %%a routerdiscovery=enabled
)

ipconfig /renew6

taskkill /f /im clash.exe /t

ipconfig /flushdns
