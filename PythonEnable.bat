@echo off
chcp 65001 > NUL

rem Enable git
call %~dp0EasyTools\Git\Git_SetPath.bat

rem Enable python.
sd-webui-forge-classic\venv\scripts\activate

