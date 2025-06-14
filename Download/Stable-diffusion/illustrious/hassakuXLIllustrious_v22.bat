@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set CIVITAI_MODEL=%EASY_TOOLS%\Download\CivitaiModel.bat
pushd %~dp0..\..\..\Model\Stable-diffusion

call %~dp0..\..\..\CivitaiKey.bat
@REM https://civitai.com/models/140272/hassaku-xl-illustrious?modelVersionId=1697082
call %CIVITAI_MODEL% illustrious\ hassakuXLIllustrious_v22.safetensors 140272 1697082
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\Model\Stable-diffusion
