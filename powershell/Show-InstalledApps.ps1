function global:Show-InstalledApps {
<#
    .SYNOPSIS
        インストールされているアプリケーションを表示する。
    .DESCRIPTION
        インストールされているアプリケーションを表示する。
    .EXAMPLE
        Show-InstalledApps
#>
    [CmdletBinding()]
    param (
        [Parameter()]
        [switch]
        $Descending
    )

    PROCESS {
        if ($Descending) { #降順ソート
            Get-ChildItem -Path('HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall','HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall','HKLM:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall') | 
              ForEach-Object { Get-ItemProperty $_.PsPath | Select-Object DisplayName, DisplayVersion, Publisher } | 
              Sort-Object DisplayName -Descending
        } else { #昇順ソート
            Get-ChildItem -Path('HKLM:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall','HKCU:SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall','HKLM:SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Uninstall') | 
              ForEach-Object { Get-ItemProperty $_.PsPath | Select-Object DisplayName, DisplayVersion, Publisher } | 
              Sort-Object DisplayName
        }
    }
}

