function GetStringToBin($cmd) {
  $binChars = New-Object System.Collections.Generic.List[System.Object]
  $chars = $cmd.Split(' ')

  foreach ($char in $chars) {
    $converted = [convert]::ToString("0x$char", 2)

    $binChars.Add($converted)
  }

  $bin = [system.String]::Join(' ', $binChars)

  return $bin
}
