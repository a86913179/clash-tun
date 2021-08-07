@echo off

cd /d %~dp0

curl.exe -X PUT -d "{}" http://127.0.0.1:9090/configs
