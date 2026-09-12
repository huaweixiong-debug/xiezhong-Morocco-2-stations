$ErrorActionPreference = 'Stop'
$credentialPath = 'C:\ProgramData\LeakTest2Channels\db-admin.json'
if (-not (Test-Path -LiteralPath $credentialPath)) { throw 'Missing MySQL admin credentials.' }
$credential = Get-Content -LiteralPath $credentialPath -Raw | ConvertFrom-Json
$env:MYSQL_PWD = $credential.password
try {
    foreach ($table in 'info_A','info_B') {
        $columns = & 'D:\MySQL84\bin\mysql.exe' --protocol=TCP -h 127.0.0.1 -P 3306 -u $credential.user --database=test --skip-column-names --execute="SELECT column_name FROM information_schema.columns WHERE table_schema='test' AND table_name='$table'"
        if ($LASTEXITCODE -ne 0) { throw "Unable to inspect $table." }
        $definitions = @(
            @{ name = '1 Pressure Unit'; after = '1 Pressure' },
            @{ name = '1 Leakage Unit'; after = '1 Leakage' },
            @{ name = '2 Pressure Unit'; after = '2 Pressure' },
            @{ name = '2 Leakage Unit'; after = '2 Leakage' }
        )
        foreach ($definition in $definitions) {
            if ($columns -contains $definition.name) { continue }
            $sql = "ALTER TABLE ``test``.``$table`` ADD COLUMN ``$($definition.name)`` VARCHAR(32) NOT NULL DEFAULT '' AFTER ``$($definition.after)``"
            & 'D:\MySQL84\bin\mysql.exe' --protocol=TCP -h 127.0.0.1 -P 3306 -u $credential.user --database=test --execute=$sql
            if ($LASTEXITCODE -ne 0) { throw "Unable to add $($definition.name) to $table." }
        }
    }
    Write-Output 'Measurement-unit columns ready in test.info_A and test.info_B.'
} finally {
    Remove-Item Env:MYSQL_PWD -ErrorAction SilentlyContinue
}
