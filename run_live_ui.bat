@echo off
cd /d D:\ATEQ
set PYTHONPATH=D:\ATEQ\.venv\Lib\site-packages
D:\Python310\python.exe -u -m app.main --live-ui --live-config D:\ATEQ\config\live.toml
