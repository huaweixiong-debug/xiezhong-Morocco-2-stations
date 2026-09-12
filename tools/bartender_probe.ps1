# bartender_probe.ps1
# 在装有 BarTender 的电脑（100.87.176.32）上运行：
#   powershell -ExecutionPolicy Bypass -File D:\ATEQ\tools\bartender_probe.ps1
# 结果写到 D:\data\bartender_probe_result.txt，并打印到控制台。
# 用 -Print 参数会额外调 bartend.exe 试打指定模板一张（验证打印链路）：
#   powershell -ExecutionPolicy Bypass -File D:\ATEQ\tools\bartender_probe.ps1 -Print -Template D:\data\E113015200-A.btw
param(
    [switch]$Print,
    [string]$Template = "D:\data\E113015200-A.btw"
)

$ErrorActionPreference = "Continue"
$templateDir = "D:\data"
$outFile = Join-Path $templateDir "bartender_probe_result.txt"
$lines = New-Object System.Collections.Generic.List[string]

function Add-Line([string]$text) {
    $lines.Add($text)
    Write-Output $text
}

Add-Line ("=== BarTender 模板字段探测 " + (Get-Date -Format "yyyy-MM-dd HH:mm:ss") + " ===")

$bt = $null
try {
    $bt = New-Object -ComObject BarTender.Application
} catch {
    Add-Line ("COM 创建失败（BarTender 未安装或未注册）: " + $_.Exception.Message)
    [System.IO.File]::WriteAllLines($outFile, $lines, [System.Text.Encoding]::UTF8)
    exit 1
}

Get-ChildItem -Path $templateDir -Filter *.btw | ForEach-Object {
    Add-Line ("")
    Add-Line ("---- 模板: " + $_.Name + " ----")
    $fmt = $null
    try {
        $fmt = $bt.Formats.Open($_.FullName, $false, "")
    } catch {
        Add-Line ("  打开失败: " + $_.Exception.Message)
        return
    }
    try {
        $ns = $fmt.NamedSubStrings
        Add-Line ("  NamedSubStrings 数量: " + $ns.Count)
        for ($i = 1; $i -le $ns.Count; $i++) {
            $item = $ns.Item($i)
            $name = ""
            $value = ""
            try { $name = $item.Name } catch { }
            try { $value = $item.Value } catch { }
            Add-Line ("    [" + $i + "] " + $name + " = " + $value)
        }
    } catch {
        Add-Line ("  NamedSubStrings 读取失败: " + $_.Exception.Message)
    }
    try {
        $dbs = $fmt.Databases
        Add-Line ("  Databases 数量: " + $dbs.Count)
        for ($i = 1; $i -le $dbs.Count; $i++) {
            $db = $dbs.Item($i)
            $dname = ""; $dtype = ""; $dconn = ""
            try { $dname = $db.Name } catch { }
            try { $dtype = $db.Type } catch { }
            try { $dconn = $db.Connection } catch { }
            Add-Line ("    DB[" + $i + "] Name=" + $dname + " Type=" + $dtype + " Connection=" + $dconn)
        }
    } catch {
        Add-Line ("  Databases 读取失败: " + $_.Exception.Message)
    }
    try { $fmt.Close(1) } catch { }
}

if ($Print) {
    Add-Line ("")
    Add-Line ("---- 试打: " + $Template + " ----")
    $bartend = "C:\Program Files\Seagull\BarTender Suite\bartend.exe"
    if (Test-Path $bartend) {
        try {
            $proc = Start-Process -FilePath $bartend -ArgumentList ('/F="' + $Template + '"','/P','/X') -Wait -PassThru
            Add-Line ("  bartend.exe 退出码: " + $proc.ExitCode)
        } catch {
            Add-Line ("  试打失败: " + $_.Exception.Message)
        }
    } else {
        Add-Line ("  未找到 bartend.exe: " + $bartend)
    }
}

try { $bt.Quit(1) } catch { }

[System.IO.File]::WriteAllLines($outFile, $lines, [System.Text.Encoding]::UTF8)
Add-Line ("")
Add-Line ("结果已保存: " + $outFile)
