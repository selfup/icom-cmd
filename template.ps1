$serialPort = ""
$cmdString = ""

$binChars = New-Object System.Collections.Generic.List[System.Object]
$chars = $cmdString.Split(' ')

foreach ($char in $chars) {
  $converted = [convert]::ToString("0x$char", 2)
  $binChars.Add($converted)
}

$numbers = [system.String]::Join('', $binChars)

$port = new-Object System.IO.Ports.SerialPort $serialPort, 9600, None, 8, one
$port.open()
$port.Write($numbers)
$port.Close()
