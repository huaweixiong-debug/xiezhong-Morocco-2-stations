@echo off
cd /d D:\ATEQ
set PYTHONPATH=D:\ATEQ\.venv\Lib\site-packages
D:\Python310\python.exe -m app.main --b-live-ui --b-port COM6 --b-slave 1
