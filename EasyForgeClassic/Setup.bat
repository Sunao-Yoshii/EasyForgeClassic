@echo off
chcp 65001 > NUL

call %~dp0ForgeClassic\ForgeClassic.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ForgeClassic\ForgeClassicExtension.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ForgeClassic\ForgeClassicLink.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )
