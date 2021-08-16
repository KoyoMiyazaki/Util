function Get-CurrentCPUTemperature {
    <#
    .SYNOPSIS
        現在のCPU温度を表示する。
    .DESCRIPTION
        現在のCPU温度を表示する。
    .EXAMPLE
        Get-CurrentCPUTemperature
#>
    PROCESS {
        $result = Get-WmiObject msacpi_thermalzonetemperature -namespace "root/wmi"
        # デフォルトではケルビン度に10を掛けた値が表示されているので、10で割ってケルビン度からセルシウス度への変換(℃ = K - 273.15)を行っている。
        $result | ForEach-Object{ConvertFrom-Csv @("$($_.InstanceName), $($_.CurrentTemperature / 10 - 273.15)") -Header "インスタンス名","温度(℃)"}
    }
}