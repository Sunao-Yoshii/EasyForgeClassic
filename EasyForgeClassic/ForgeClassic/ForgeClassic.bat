@echo off
chcp 65001 > NUL
set CURL_CMD=C:\Windows\System32\curl.exe -kL
set EASY_TOOLS=%~dp0..\..\EasyTools
set GITHUB_CLONE_OR_PULL=%EASY_TOOLS%\Git\GitHub_CloneOrPull.bat

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

@REM echo pip install -qq triton-windows==3.3.1.post19
@REM pip install -qq triton-windows==3.3.1.post19
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

@REM set "TRITON_CACHE=C:\Users\%USERNAME%\.triton\cache"
@REM set "TORCH_INDUCTOR_TEMP=C:\Users\%USERNAME%\AppData\Local\Temp\torchinductor_%USERNAME%"

@REM if not exist "%TRITON_CACHE%" ( goto :EASY_TRITON_CACHE_NOT_FOUND )
@REM echo rmdir /S /Q "%TRITON_CACHE%"
@REM rmdir /S /Q "%TRITON_CACHE%"
@REM @REM if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
@REM :EASY_TRITON_CACHE_NOT_FOUND

@REM if not exist "%TORCH_INDUCTOR_TEMP%" ( goto :EASY_TORCH_INDUCTOR_TEMP_NOT_FOUND )
@REM echo rmdir /S /Q "%TORCH_INDUCTOR_TEMP%"
@REM rmdir /S /Q "%TORCH_INDUCTOR_TEMP%"
@REM @REM if %ERRORLEVEL% neq 0 ( pause & exit /b 1 )
@REM :EASY_TORCH_INDUCTOR_TEMP_NOT_FOUND

@REM echo pip install -qq https://github.com/woct0rdho/SageAttention/releases/download/v2.1.1-windows/sageattention-2.1.1+cu126torch2.6.0-cp311-cp311-win_amd64.whl
@REM pip install -qq https://github.com/woct0rdho/SageAttention/releases/download/v2.1.1-windows/sageattention-2.1.1+cu126torch2.6.0-cp311-cp311-win_amd64.whl
@REM if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

popd