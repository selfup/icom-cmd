function GetStringToBin($cmdString) {
  $binChars = New-Object System.Collections.Generic.List[System.Object]
  $chars = $cmdString.Split(' ')

  foreach ($char in $chars) {
    [Byte] $converted = [int]"0x$char"
    $binChars.Add($converted)
  }

  [Byte[]] $bin = $binChars

  return $bin
}
