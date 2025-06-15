@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set EASY_TOOLS=%~dp0..\..\EasyTools
set GITHUB_CLONE_OR_PULL=%EASY_TOOLS%\Git\GitHub_CloneOrPull.bat

copy src\python_* %EASY_TOOLS%\Python\

pushd %~dp0..\..

@REM echo https://github.com/Haoming02/sd-webui-forge-classic
call %GITHUB_CLONE_OR_PULL% Haoming02 sd-webui-forge-classic main e03fda0b0af3bb2f43aaa7b18bc06e7338dd6338
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd
pushd %~dp0..\..\sd-webui-forge-classic

set EASY_PYTHON_VERSION=3.11.9

call %EASY_TOOLS%\Python\Python_Activate.bat
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

echo python -m pip install -qq -U pip setuptools wheel
python -m pip install -qq -U pip setuptools wheel
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd