# ICOM Powershell Serialport Command Sender

### Known compatible targets

* ICOM IC-7610

### Usage

There is a template file that you can just copy and paste anywhere (Desktop for example).

This file is called: `template.ps1`

It has all the needed functions to run. You just have to set these variables:

```ps1
$comPort = ""
$cmdString = ""
```

For example:

```ps1
$serialPort = "COM12"
$cmdString = "FE FE 94 E0 26 00 05 00 01 FD"
```

Rename the file as you see fit, as long as the `.ps1` extension remains.

Right click and "Run with Powershell", and it will fire off your command to the set port :tada:

### Development

Please read the `CODE_OF_CONDUCT.md` file :pray:

I use [VSCode](https://code.visualstudio.com/) with two extensions for this project:

1. [Powershell](https://marketplace.visualstudio.com/items?itemName=ms-vscode.PowerShell)
1. [Editorconfig](https://marketplace.visualstudio.com/items?itemName=EditorConfig.EditorConfig)

Please fork the project and make a Pull Request (PR) to contribute!

### Reading Materials

`FE FE` begins a command - `FD` ends a command

1. HEX to BIN table: http://vlsm-calc.net/decbinhex.php
1. CI-V Reference Manual: http://www.icomamerica.com/en/support/kb/article.aspx?ArticleNumber=63AE624429
1. ICOM IC-7610 Reference Manual: http://www.icomamerica.com/en/downloads/default.aspx?Category=661
1. Old CT-17 Reference Manual with BASIC code blocks: http://www.icom.co.jp/world/support/download/manual/pdf/CT-17.pdf
1. Decimal Array to Binary `$port.Write/3`: https://social.technet.microsoft.com/Forums/office/en-US/c0cad62d-5e6d-47de-97a6-406f50025d7f/sendingreading-hex-data-to-a-serial-port-in-powershell?forum=winserverpowershell
