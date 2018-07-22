$serialPort = ""
$cmdString = ""

$binChars = New-Object System.Collections.Generic.List[System.Object]
$chars = $cmdString.Split(' ')

foreach ($char in $chars) {
  [Byte] $converted = [int]"0x$char"
  $binChars.Add($converted)
}

[Byte[]] $numbers = $binChars

$port = new-Object System.IO.Ports.SerialPort $serialPort, 9600, None, 8, one
$port.open()
$port.Write($numbers, 0, $numbers.Count)
$port.Close()
