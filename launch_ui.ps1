$env:PYTHONPATH = "D:\ATEQ\.venv\Lib\site-packages"
$proc = Start-Process -FilePath "D:\Python310\python.exe" -ArgumentList "-m","app.main","--b-live-ui","--b-port","COM6","--b-slave","1" -WorkingDirectory "D:\ATEQ" -WindowStyle Normal -PassThru
Write-Output "PID: $($proc.Id)"
