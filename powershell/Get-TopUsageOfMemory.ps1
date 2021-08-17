function global:Get-TopUsageOfMemory {
    <#
    .SYNOPSIS
        メモリ使用率の高いプロセスを出力する。

    .DESCRIPTION
        メモリ使用率の高いプロセスを出力する。

    .EXAMPLE
        Get-TopUsageOfMemory

    .EXAMPLE
        Get-TopUsageOfMemory -Limit 5

    .PARAMETER Limit
        メモリ使用率の高いプロセスの最大出力数
        デフォルト値: 10
#>
    [CmdletBinding()]
    param (
        [Parameter()]
        [int]$Limit = 10
    )
    PROCESS {
        $result = Get-Process | Select-Object Name, WS | Sort-Object -Descending WS
        $result | ForEach-Object{$_.WS = $_.WS / 1MB} #メガバイトに変換
        $result | Select-Object -First $Limit
    }
}