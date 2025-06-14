@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set GITHUB_CLONE_OR_PULL=%EASY_TOOLS%\Git\GitHub_CloneOrPull.bat
set CURL_CMD=C:\Windows\System32\curl.exe -kL

pushd %~dp0..\..\sd-webui-forge-classic\extensions

@REM https://github.com/DominikDoom/a1111-sd-webui-tagcomplete
call %GITHUB_CLONE_OR_PULL% DominikDoom a1111-sd-webui-tagcomplete main c341ccccb6e10ec0b84403f4c95803532f6fd0aa
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/Bing-su/adetailer
call %GITHUB_CLONE_OR_PULL% Bing-su adetailer main 36189cbea735b85fd01e98ac42002b8ce6f0e41d
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/adieyal/sd-dynamic-prompts
call %GITHUB_CLONE_OR_PULL% adieyal sd-dynamic-prompts main de056ff8d80e4ad120e13a90cf200f3383f427c6
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/Haoming02/sd-forge-couple
call %GITHUB_CLONE_OR_PULL% Haoming02 sd-forge-couple main 707f72c1f8d4401e96eaeffbff5755fad9299b12
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/xhoxye/sd-webui-ar_xhox
call %GITHUB_CLONE_OR_PULL% xhoxye sd-webui-ar_xhox main 4c11b19e198078148e7d683987e8fc2462bbe460
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/KohakuBlueleaf/z-tipo-extension
call %GITHUB_CLONE_OR_PULL% KohakuBlueleaf z-tipo-extension main 32d61cf213f6346b05e69fc57fe830ecd9fbfca8
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/L4Ph/stable-diffusion-webui-localization-ja_JP
call %GITHUB_CLONE_OR_PULL% L4Ph stable-diffusion-webui-localization-ja_JP main d639f8ca6d635686806bebfc8fb6efbe9a71e636
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/light-and-ray/sd-webui-lama-cleaner-masked-content
call %GITHUB_CLONE_OR_PULL% light-and-ray sd-webui-lama-cleaner-masked-content master 72d253cb1afc55ee2d4ff2f0a2b7304b8b59bc02
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/adieyal/sd-dynamic-prompts
call %GITHUB_CLONE_OR_PULL% adieyal sd-dynamic-prompts master de056ff8d80e4ad120e13a90cf200f3383f427c6
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/AUTOMATIC1111/stable-diffusion-webui-wildcards
call %GITHUB_CLONE_OR_PULL% AUTOMATIC1111 stable-diffusion-webui-wildcards master d3964a790d13754d3f944c8407cd6ea4ebfb7982
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/AUTOMATIC1111/stable-diffusion-webui-rembg
call %GITHUB_CLONE_OR_PULL% AUTOMATIC1111 stable-diffusion-webui-rembg master a4c07b857e73f3035f759876797fa6de986def3d
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

@REM https://github.com/blue-pen5805/sdweb-easy-prompt-selector
call %GITHUB_CLONE_OR_PULL% blue-pen5805 sdweb-easy-prompt-selector main 053045eb6f1f240e557fd7271714e8718751f84f
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\sd-webui-forge-classic\extensions
exit /b 0
