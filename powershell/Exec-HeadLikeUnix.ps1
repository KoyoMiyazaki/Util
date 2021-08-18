function global:Exec-HeadLikeUnix {
<#
    .SYNOPSIS
        UnixコマンドライクなHeadスクリプト
    .DESCRIPTION
        UnixコマンドライクなHeadスクリプト
    .EXAMPLE
        Exec-HeadLikeUnix
    .EXAMPLE
        Exec-HeadLikeUnix -Filename C:\Users\test.txt -Limit 5

    .PARAMETER Filename
    表示するファイル名(必須)

    .PARAMETER Limit
    最大出力行数
    デフォルト値: 10
        
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string[]]
        $Filename,

        [Parameter()]
        [int]$Limit = 10
    )

    PROCESS {
        Get-Content -Path $Filename -Head $Limit
    }
}