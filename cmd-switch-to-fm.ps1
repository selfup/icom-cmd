. ./lib/string-to-bin.ps1
. ./lib/serial-write.ps1

$serialPort = "COM1"
$cmdString = "FE FE 94 E0 26 00 05 00 01 FD"

$numbers = GetStringToBin $cmdString

WriteToSerialPort $serialPort, $numbers
