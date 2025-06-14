@echo off
chcp 65001 > NUL
@REM Minimum は Civitai ログイン不要を維持する

call %~dp0..\adetailer\bbox\face_yolov9c.bat
call %~dp0..\adetailer\bbox\foot_yolov8x_v2.bat
call %~dp0..\adetailer\bbox\hand_yolov9c.bat

call %~dp0..\adetailer\segm\AnzhcBreasts-v1-1024-seg.bat
call %~dp0..\adetailer\segm\AnzhcEyes-seg.bat
call %~dp0..\adetailer\segm\AnzhcFace-v2-640-seg.bat
call %~dp0..\adetailer\segm\AnzhcFace-v2-768MS-seg.bat
call %~dp0..\adetailer\segm\AnzhcFace-v2-1024-seg.bat
call %~dp0..\adetailer\segm\AnzhcHead-seg.bat
call %~dp0..\adetailer\segm\AnzhcHeadHair-seg.bat
call %~dp0..\adetailer\segm\PitHandDetailer-v1b-seg.bat

call %~dp0..\All\ESRGAN.bat

call %~dp0..\ControlNet\Sdxl\Inpaint_Kataragi.bat
call %~dp0..\ControlNet\Pony\AnyTest_PonyDim256_v40.bat
call %~dp0..\ControlNet\NoobE\NoobE_Tile.bat
call %~dp0..\ControlNet\NoobE\NoobE_Inpaint.bat

call %~dp0..\VAE\Sdxl\sdxl_vae.bat
call %~dp0..\VAE\Sdxl\songVae_v10.bat

call %~dp0..\wildcards\noob_1girl.bat
call %~dp0..\wildcards\tipo_1girl.bat
call %~dp0..\wildcards\tipo_play.bat
call %~dp0..\wildcards\tipo_location.bat
