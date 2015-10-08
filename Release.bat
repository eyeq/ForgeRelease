@echo off
set exe="C:\Program Files\7-Zip\7z.exe"
cd ..
for /d %%a in (*) do (call :hoge "%%a")
goto end

:hoge
if not exist %~1\build\libs (exit /b)
cd %~1\build
ren libs\*.jar *.zip
for /R %%i in (libs\*) do (call :foo "%%i")
move /Y libs\* ..\..\releases
cd ..\..
exit /b

:foo
%exe% a %~1 sources
exit /b

:end
