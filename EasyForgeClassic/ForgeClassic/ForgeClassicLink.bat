@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0..\..\EasyTools
set JUNCTION=%EASY_TOOLS%\Link\Junction.bat

pushd %~dp0..\..\sd-webui-forge-classic

call %JUNCTION% models\adetailer ..\Model\adetailer
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% models\ControlNet ..\Model\ControlNet
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% models\ESRGAN ..\Model\ESRGAN
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% models\Lora ..\Model\Lora
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% models\Stable-diffusion ..\Model\Stable-diffusion
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% models\VAE ..\Model\VAE
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% extensions\stable-diffusion-webui-wildcards\wildcards ..\Model\wildcards 
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

call %JUNCTION% ..\Model\EasyPromptSelector extensions\sdweb-easy-prompt-selector\tags  
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

if not exist ..\Model\wildcards\1girl.txt ( copy /Y %~dp0src\1girl.txt ..\Model\wildcards\ )
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )
if not exist ..\Model\wildcards\play.txt ( copy /Y %~dp0src\play.txt ..\Model\wildcards\ )
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

rem Default config files
copy /Y %~dp0src\config.json ..\sd-webui-forge-classic\config.json
copy /Y %~dp0src\ui-config.json ..\sd-webui-forge-classic\ui-config.json

rem Copy EasyPromptSelector files
if not exist ..\Model\EasyPromptSelector\Illustrious_rating.yml ( copy /Y %~dp0src\Illustrious_rating.yml ..\Model\EasyPromptSelector\ )
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )
if not exist ..\Model\EasyPromptSelector\Illustrious_settings.yml ( copy /Y %~dp0src\Illustrious_settings.yml ..\Model\EasyPromptSelector\ )
if %ERRORLEVEL% neq 0 ( pause & popd & exit /b 1 )

rem Create output directories
if not exist outputs\txt2img-images\ ( mkdir outputs\txt2img-images )
if not exist outputs\img2img-images\ ( mkdir outputs\img2img-images )
if not exist outputs\extras-images\ ( mkdir outputs\extras-images )
if not exist outputs\txt2img-grids\ ( mkdir outputs\txt2img-grids )
if not exist outputs\img2img-grids\ ( mkdir outputs\img2img-grids )
if not exist log\images\ ( mkdir log\images )

call %JUNCTION% ..\OutputForge outputs
if %ERRORLEVEL% neq 0 ( popd & exit /b 1 )

popd rem %~dp0..\..\sd-webui-forge-classic
