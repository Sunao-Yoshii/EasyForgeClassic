@echo off
chcp 65001 > NUL
@REM Minimum は Civitai ログイン不要を維持する

call %~dp0illustrious_minimum.bat
call %~dp0src\illustriousCommon_Standard.bat
call %~dp0Stable-diffusion\illustrious\aetheria_v1.0.bat
call %~dp0Stable-diffusion\illustrious\hassakuXLIllustrious_v22.bat
call %~dp0Stable-diffusion\illustrious\wai-nsfw-illustrious-sdxl_v14.0.bat
