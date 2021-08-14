function Get-LargeSizeFiles {
    <#
    .SYNOPSIS
        サイズが大きいファイルを探し、その一覧を出力する。

    .DESCRIPTION
        サイズが大きいファイルを探し、その一覧を出力する。

    .EXAMPLE
        Get-LargeSizeFiles

    .EXAMPLE
        Get-LargeSizeFiles -Path C:\Users\xxxx\programming -Limit 5

    .PARAMETER Path
        探索対象のフォルダを指定する。
        デフォルト値: C:\(Cドライブ直下)

    .PARAMETER Limit
        サイズが大きいファイルの最大出力数
        デフォルト値: 10
#>
    [CmdletBinding()]
    param (
        [Parameter()]
        [string[]]$Path = "C:\",
        [int]$Limit = 10
    )
    PROCESS {
        Get-ChildItem -Path $Path -Recurse | Select-Object Length,FullName | 
            Sort-Object -Descending Length | Select-Object -First $Limit
    }
}