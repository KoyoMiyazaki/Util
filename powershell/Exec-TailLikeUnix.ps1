function global:Exec-TailLikeUnix {
<#
    .SYNOPSIS
        UnixコマンドライクなTailスクリプト
    .DESCRIPTION
        UnixコマンドライクなTailスクリプト
    .EXAMPLE
        Exec-TailLikeUnix
    .EXAMPLE
        Exec-TailLikeUnix -Path C:\Users -Limit 5

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
        Get-Content -Path $Filename -Tail $Limit
    }
}