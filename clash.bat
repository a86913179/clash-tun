@echo off

cd /d %~dp0

clash.exe -d . > clash.log
