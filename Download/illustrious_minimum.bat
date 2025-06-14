@echo off
chcp 65001 > NUL
@REM Minimum は Civitai ログイン不要を維持する

call %~dp0src\illustriousCommon_Minimum.bat
call %~dp0Stable-diffusion\illustrious\copycat-illustrious_v7.0.bat
