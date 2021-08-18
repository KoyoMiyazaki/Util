function global:Load-PSScripts {
<#
    .SYNOPSIS
        PowerShellスクリプトを一括ロードする。
    .DESCRIPTION
        PowerShellスクリプトを一括ロードする。
    .EXAMPLE
        Load-PSScripts
    .EXAMPLE
        Load-PSScripts -Path C:\Users\xx
    .PARAMETER Path
        ロード対象のフォルダを指定する。
        デフォルト値: PSScriptDir(環境変数)
#>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string[]]$Path = $env:PSScriptDir
    )

    PROCESS {
        if(!$Path) {
            Write-Host "環境変数 PSScriptDir が登録されていません。"
            Write-Host "登録するか、Pathを指定してスクリプトを実行しなおしてください。"
        } else {
            Get-ChildItem $Path -Filter *.ps1 | ForEach-Object {
            . $_.FullName
            Write-Host $_.FullName "... " -NoNewline; Write-Host "Loaded" -ForegroundColor Green
            }
        }
    }
}