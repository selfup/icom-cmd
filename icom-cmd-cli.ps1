param (
    [string] $serialPort,
    [string] $cmdString
)

if (!$serialPort) {
    Write-Output "Please pass a serial port as the first argument"
    return
}

if (!$cmdString) {
    Write-Output "Please pass a space delimited HEX string as the second argument"
    return
}

function HexToBin($hexString) {
    $bins = New-Object System.Collections.Generic.List[System.Object]
    $hexes = $hexString.Split(' ')

    foreach ($hex in $hexes) {
        $converted = [int]"0x$hex"
        $bins.Add($converted)
    }

    return $bins
}

function WriteCmdToPort($radioPort, $radioCommand) {
    $binaries = HexToBin $radioCommand

    $port = new-Object System.IO.Ports.SerialPort $radioPort,
    9600, None, 8, one

    $port.open()

    # must sleep for 100ms to let radio be ready to process
    Start-Sleep -m 100

    $port.Write($binaries, 0, $binaries.Count)

    # must sleep for 100ms to let the radio process the byte array
    Start-Sleep -m 100

    $port.Close()
}

WriteCmdToPort $serialPort $cmdString
