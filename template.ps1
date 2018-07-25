$serialPort = "COM3"
$cmdString = "FE FE 94 E0 26 00 05 00 01 FD"

$bins = New-Object System.Collections.Generic.List[System.Object]
$hexes = $cmdString.Split(' ')

foreach ($hex in $hexes) {
    [Byte] $converted = [int]"0x$hex"
    $bins.Add($converted)
}

[Byte[]] $binaries = $bins

$port = new-Object System.IO.Ports.SerialPort $serialPort,
    9600, None, 8, one

$port.open()

# must sleep for 100ms to let radio be ready to process
Start-Sleep -m 100

$port.Write($binaries, 0, $binaries.Count)

# must sleep for 100ms to let the radio process the byte array
Start-Sleep -m 100

$port.Close()
