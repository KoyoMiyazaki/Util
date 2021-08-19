function global:Exec-CutLikeUnix {
<#
    .SYNOPSIS
        UnixコマンドライクなCutスクリプト
    .DESCRIPTION
        UnixコマンドライクなCutスクリプト
    .EXAMPLE
        Exec-CutLikeUnix -Filename C:\Users\test.txt -Field 1
    .EXAMPLE
        Exec-CutLikeUnix -Filename C:\Users\test.txt -Delimiter "," -Field 1

    .PARAMETER Filename
    表示するファイル名(必須)

    .PARAMETER Delimiter
    区切り文字
    デフォルト値: " "

    .PARAMETER Field
    表示する位置番号
        
#>
    [CmdletBinding()]
    param (
        [Parameter(Mandatory)]
        [string[]]
        $Filename,

        [Parameter()]
        [string[]]
        $Delimiter = " ",

        [Parameter(Mandatory)]
        [int]
        $Field
    )

    PROCESS {
        Get-Content -Path $Filename | ForEach-Object {$($_ -split($Delimiter))[$Field-1]}
    }
}