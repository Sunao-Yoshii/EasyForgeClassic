@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set CIVITAI_MODEL=%EASY_TOOLS%\Download\CivitaiModel.bat
pushd %~dp0..\..\..\Model\Stable-diffusion

call %~dp0..\..\..\CivitaiKey.bat
@REM https://civitai.com/models/1541411/aetheria
call %CIVITAI_MODEL% illustrious\ aetheria_v10.safetensors 1541411 1744078
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\Model\Stable-diffusion
