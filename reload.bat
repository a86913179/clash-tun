@echo off

cd /d %~dp0

curl.exe -d "{}" -H "Content-Type: application/json" -X PUT http://127.0.0.1:9090/configs?force=true

ipconfig /flushdns
