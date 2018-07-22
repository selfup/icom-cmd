function WriteToSerialPort($serialPort, $numbers) {
  $port = new-Object System.IO.Ports.SerialPort $serialPort, 9600, None, 8, one

  $port.open()

  $port.Write($numbers)

  $port.Close()
}
