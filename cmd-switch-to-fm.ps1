. ./lib/string-to-bin.ps1
. ./lib/serial-write.ps1

$serialPort = "COM1"
$cmdString = "FE FE"

$numbers = GetStringToBin $cmdString

WriteToSerialPort $serialPort, $numbers
