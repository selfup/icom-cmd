# ICOM Powershell Serialport Command Sender

### Known compatible targets

* ICOM IC-7610

### Usage

There will be premade cmds as powershell scripts.

For example to change to FM you can run the `cmd-switch-to-fm.ps1` file.

1. Change the `$serialPort` variable to your USB port in the `cmd-` file of your choosing: `$serialPort = ''`
2. Double click the premade commands (once you set the port) or use the portable file to make your own!

### Portable File for Communicating to Multple Ports/Radios

There is a template file that you can just copy and paste anywhere (Desktop for example).

This file is called: `template.ps1`

It has all the needed functions to run. You just have to set these variables:

```ps1
$comPort = ""
$cmdString = ""
```

For example:

```ps1
$serialPort = "COM1"
$cmdString = "FA FA"
```

Rename the file as you see fit, as long as the `.ps1` extension remains.

Double click (or right click and run powershell), and it will fire off your command (translate to binary) to the set port :tada:

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
1. https://social.technet.microsoft.com/Forums/office/en-US/c0cad62d-5e6d-47de-97a6-406f50025d7f/sendingreading-hex-data-to-a-serial-port-in-powershell?forum=winserverpowershell
