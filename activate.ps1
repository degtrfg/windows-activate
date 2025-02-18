# 检查管理员权限
if (!([Security.Principal.WindowsPrincipal][Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Start-Process PowerShell -Verb RunAs "-NoProfile -ExecutionPolicy Bypass -Command `"cd '$pwd'; & '$PSCommandPath';`""
    exit
}

$TempDir = "$env:TEMP\WinAct"
New-Item -ItemType Directory -Force -Path $TempDir | Out-Null

# 获取系统信息
$EditionID = (Get-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion").EditionID

# 设置密钥
$Keys = @{
    "Professional" = "W269N-WFGWX-YVC9B-4J6C9-T83GX"
    "Enterprise" = "NPPR9-FWDCX-D2C8J-H872K-2YT43"
    "Education" = "NW6C2-QMPVW-D7KKK-3GKT6-VCFB2"
    "Core" = "TX9XD-98N7V-6WMQ6-BX7FG-H8Q99"
}

Write-Host "正在准备激活..." -ForegroundColor Cyan

# 停止服务
Stop-Service sppsvc -Force -ErrorAction SilentlyContinue
Stop-Service wuauserv -Force -ErrorAction SilentlyContinue

# 清理激活
cmd /c "slmgr /upk" | Out-Null
cmd /c "slmgr /cpky" | Out-Null

# 安装密钥
if ($Keys.ContainsKey($EditionID)) {
    cmd /c "slmgr /ipk $($Keys[$EditionID])" | Out-Null
}

# 下载激活组件
Write-Host "正在注入数字许可..." -ForegroundColor Cyan
$url = "https://raw.githubusercontent.com/TGSAN/CMWTAT_Digital_Edition/master/resources/GatherOsState.exe"
(New-Object Net.WebClient).DownloadFile($url, "$TempDir\GatherOsState.exe")

# 执行激活
Set-Location $TempDir
Start-Process -FilePath "GatherOsState.exe" -Wait
if (Test-Path "GenuineTicket.xml") {
    & clipup -v -o -altto "GenuineTicket.xml"
}

# 配置保护
$RegEdits = @{
    "HKLM:\SYSTEM\Tokens" = @{"Channel" = "Retail"}
    "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SoftwareProtectionPlatform" = @{
        "KeyManagementServiceName" = "127.0.0.1"
        "BackupProductKeyDefault" = "1"
        "Manual" = "1"
    }
}

foreach ($Path in $RegEdits.Keys) {
    if (!(Test-Path $Path)) { New-Item -Path $Path -Force | Out-Null }
    foreach ($Name in $RegEdits[$Path].Keys) {
        Set-ItemProperty -Path $Path -Name $Name -Value $RegEdits[$Path][$Name] -Force
    }
}

# 重启服务
Start-Service sppsvc
Start-Service wuauserv

# 完成激活
Write-Host "正在完成激活..." -ForegroundColor Cyan
cmd /c "slmgr /ato" | Out-Null

# 验证状态
$Status = cmd /c "slmgr /xpr"
Write-Host "`n激活状态：" -ForegroundColor Green
Write-Host $Status

# 清理
Remove-Item -Path $TempDir -Recurse -Force -ErrorAction SilentlyContinue

Write-Host "`n激活完成！无需重启。" -ForegroundColor Green
Write-Host "可在'设置-系统-激活'中查看状态。" -ForegroundColor Yellow
