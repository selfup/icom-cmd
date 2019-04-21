param (
    [Parameter(Position = 0, mandatory = $true)]
    [string]$comPort,
    [Parameter(Position = 1, mandatory = $true)]
    [string]$spaceSeparatedHEX,
    [string]$timeout = "No"
)

$serialPort = $comPort
$cmdString = $spaceSeparatedHEX

$convertedHexes = New-Object System.Collections.Generic.List[System.Object]
$hexes = $cmdString.Split(' ')

foreach ($hex in $hexes) {
    try {
        [Byte] $converted = [int]"0x$hex"
    }
    catch {
        Write-Error "Failed to convert HEX to byte - invalid HEX!"
        exit
    }

    $convertedHexes.Add($converted)
}

[Byte[]] $binaries = $convertedHexes

$port = New-Object System.IO.Ports.SerialPort $serialPort,
9600, None, 8, one

$port.open()

$port.Write($binaries, 0, $binaries.Count)

if ($timeout -ne "No") {
    Write-Output "Forcing a timeout!"

    [int]$milliseconds = [convert]::ToInt32($timeout, 10)
    
    Start-Sleep -Milliseconds $milliseconds
}
else {
    Write-Output "Waiting for device to respond..."

    $result = $port.ReadLine()

    Write-Output "---"
    Write-Output $result
    Write-Output "---"
}

$port.Close()

Write-Output "Port Closed"
