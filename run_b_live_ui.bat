@echo off
cd /d D:\ATEQ
set PYTHONPATH=D:\ATEQ\.venv\Lib\site-packages
D:\Python310\python.exe -u -m app.main --b-live-ui --b-port COM6 --b-slave 1 >> D:\ATEQ\ui_console.log 2>&1
echo. >> D:\ATEQ\ui_console.log
echo === UI exited at %date% %time% === >> D:\ATEQ\ui_console.log
