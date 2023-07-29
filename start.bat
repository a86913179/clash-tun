@echo off

cd /d %~dp0

cscript clash.vbs

powershell -Command "& { Add-DnsClientNrptRule -Comment "clash-tun" -Namespace "." -NameServers "198.18.0.2" }"

ipconfig /flushdns
