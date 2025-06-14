@echo off
chcp 65001 > NUL
set EASY_TOOLS=%~dp0EasyTools
set EMBEDDABLE_PYTHON=%EASY_TOOLS%\Python\env\python311

if not exist %~dp0sd-webui-forge-classic\venv\ (
	echo call %~dp0Update.bat
	call %~dp0Update.bat
)
if not exist %~dp0sd-webui-forge-classic\venv\ (
	echo "[Error] %~dp0sd-webui-forge-classic\venv\ が見つかりません。"
	pause & exit /b 1
)

pushd %~dp0sd-webui-forge-classic

if not exist styles.csv (
	echo copy %~dp0EasyForgeClassic\ForgeClassic\src\styles.csv styles.csv
	copy %~dp0EasyForgeClassic\ForgeClassic\src\styles.csv styles.csv
)

set PYTHON=%~dp0sd-webui-forge-classic\venv\Scripts\python.exe
set VENV_DIR=%~dp0sd-webui-forge-classic\venv

where /Q git
if %ERRORLEVEL% equ 0 (
	set GIT=
)
if %ERRORLEVEL% neq 0 (
	set GIT=%~dp0EasyTools\Git\env\PortableGit\bin\git.exe
	call %~dp0EasyTools\Git\Git_SetPath.bat
)

if exist %EMBEDDABLE_PYTHON%\ (
	@REM tcc.exe & VS Build Tools cl.exe
	if not exist %~dp0sd-webui-forge-classic\venv\Scripts\Include\Python.h (
		echo xcopy /SQY %EMBEDDABLE_PYTHON%\include\*.* %~dp0sd-webui-forge-classic\venv\Scripts\Include\
		xcopy /SQY %EMBEDDABLE_PYTHON%\include\*.* %~dp0sd-webui-forge-classic\venv\Scripts\Include\

		echo xcopy /SQY %EMBEDDABLE_PYTHON%\libs\*.* %~dp0sd-webui-forge-classic\venv\Scripts\libs\
		xcopy /SQY %EMBEDDABLE_PYTHON%\libs\*.* %~dp0sd-webui-forge-classic\venv\Scripts\libs\
	)

	@REM VS Build Tools
	@REM echo set "INCLUDE=%INCLUDE%;%EMBEDDABLE_PYTHON%\include"
	@REM set "INCLUDE=%INCLUDE%;%EMBEDDABLE_PYTHON%\include"
)

@REM LBW bug: --api --enable-insecure-extension-access
@REM https://github.com/hako-mikan/sd-webui-lora-block-weight?tab=readme-ov-file#api%E3%82%92%E9%80%9A%E3%81%97%E3%81%A6%E3%81%AE%E5%88%A9%E7%94%A8%E3%81%AB%E3%81%A4%E3%81%84%E3%81%A6
if "%COMMANDLINE_ARGS%"=="" (
    set "COMMANDLINE_ARGS=%*"
) else (
    set "COMMANDLINE_ARGS=%COMMANDLINE_ARGS% %*"
)

echo.
echo PYTHON: %PYTHON%
echo VENV_DIR: %VENV_DIR%
echo GIT: %GIT%
echo webui.bat %COMMANDLINE_ARGS%
echo.
echo http://localhost:7860/
echo.
call webui.bat %COMMANDLINE_ARGS%

popd rem %~dp0sd-webui-forge-classic
