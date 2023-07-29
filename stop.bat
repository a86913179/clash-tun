@echo off

cd /d %~dp0

powershell -Command "& { Get-DnsClientNrptRule | where "Comment" -eq "clash-tun" | foreach { Remove-DnsClientNrptRule -Name "$_.Name" -Force } }"

taskkill /f /im clash.exe /t

ipconfig /flushdns
