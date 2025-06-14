@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\..\EasyTools
set CIVITAI_MODEL=%EASY_TOOLS%\Download\CivitaiModel.bat
pushd %~dp0..\..\..\Model\Stable-diffusion

call %~dp0..\..\..\CivitaiKey.bat
@REM https://civitai.com/models/827184/wai-nsfw-illustrious-sdxl?modelVersionId=1761560
call %CIVITAI_MODEL% illustrious\ waiNSFWIllustrious_v140.safetensors 827184 1761560
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\..\Model\Stable-diffusion
