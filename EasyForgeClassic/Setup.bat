@echo off
chcp 65001 > NUL

call %~dp0ForgeClassic\ForgeClassic.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ForgeClassic\ForgeClassicExtension.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

call %~dp0ForgeClassic\ForgeClassicLink.bat
if %ERRORLEVEL% neq 0 ( exit /b 1 )

if exist %~dp0vc_redist.x64.exe ( goto :EXIST_VC_REDIST_X64 )
echo.
echo %CURL_CMD% -o %~dp0vc_redist.x64.exe https://aka.ms/vs/17/release/vc_redist.x64.exe
%CURL_CMD% -o %~dp0vc_redist.x64.exe https://aka.ms/vs/17/release/vc_redist.x64.exe
if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
:EXIST_VC_REDIST_X64
